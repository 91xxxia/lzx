<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病人编号" prop="patientId">
        <el-input
          v-model="queryParams.patientId"
          placeholder="请输入病人编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联临床就诊记录" prop="clinicalVisitId">
        <el-input
          v-model="queryParams.clinicalVisitId"
          placeholder="请输入关联临床就诊记录"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="事件名" prop="eventName">
        <el-input
          v-model="queryParams.eventName"
          placeholder="请输入事件名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="采集日期" prop="eventDate">
        <el-date-picker clearable
          v-model="queryParams.eventDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择采集日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="协议版本" prop="protocolVersion">
        <el-input
          v-model="queryParams.protocolVersion"
          placeholder="请输入协议版本"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="记录者编号" prop="collectorId">
        <el-input
          v-model="queryParams.collectorId"
          placeholder="请输入记录者编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['BiobankSys:events:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['BiobankSys:events:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['BiobankSys:events:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:events:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="eventsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="事件号" align="center" prop="eventId" />
      <el-table-column label="病人编号" align="center" prop="patientId" />
      <el-table-column label="关联临床就诊记录" align="center" prop="clinicalVisitId" />
      <el-table-column label="事件名" align="center" prop="eventName" />
      <el-table-column label="采集日期" align="center" prop="eventDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.eventDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="协议版本" align="center" prop="protocolVersion" />
      <el-table-column label="记录者编号" align="center" prop="collectorId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:events:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:events:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改样本采集事件对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人编号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人编号" />
        </el-form-item>
        <el-form-item label="关联临床就诊记录" prop="clinicalVisitId">
          <el-input v-model="form.clinicalVisitId" placeholder="请输入关联临床就诊记录" />
        </el-form-item>
        <el-form-item label="事件名" prop="eventName">
          <el-input v-model="form.eventName" placeholder="请输入事件名" />
        </el-form-item>
        <el-form-item label="采集日期" prop="eventDate">
          <el-date-picker clearable
            v-model="form.eventDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择采集日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="协议版本" prop="protocolVersion">
          <el-input v-model="form.protocolVersion" placeholder="请输入协议版本" />
        </el-form-item>
        <el-form-item label="记录者编号" prop="collectorId">
          <el-input v-model="form.collectorId" placeholder="请输入记录者编号" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listEvents, getEvents, delEvents, addEvents, updateEvents } from "@/api/BiobankSys/events"

export default {
  name: "Events",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 样本采集事件表格数据
      eventsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        patientId: null,
        clinicalVisitId: null,
        eventName: null,
        eventDate: null,
        protocolVersion: null,
        collectorId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        patientId: [
          { required: true, message: "病人编号不能为空", trigger: "blur" }
        ],
        eventDate: [
          { required: true, message: "采集日期不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询样本采集事件列表 */
    getList() {
      this.loading = true
      listEvents(this.queryParams).then(response => {
        this.eventsList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        eventId: null,
        patientId: null,
        clinicalVisitId: null,
        eventName: null,
        eventDate: null,
        protocolVersion: null,
        collectorId: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.eventId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本采集事件"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const eventId = row.eventId || this.ids
      getEvents(eventId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改样本采集事件"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.eventId != null) {
            updateEvents(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addEvents(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const eventIds = row.eventId || this.ids
      this.$modal.confirm('是否确认删除样本采集事件编号为"' + eventIds + '"的数据项？').then(function() {
        return delEvents(eventIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/events/export', {
        ...this.queryParams
      }, `events_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
