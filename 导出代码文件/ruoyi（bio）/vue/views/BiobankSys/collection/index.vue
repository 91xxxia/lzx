<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="样本号" prop="specimenId">
        <el-input
          v-model="queryParams.specimenId"
          placeholder="请输入样本号"
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
          v-hasPermi="['BiobankSys:collection:add']"
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
          v-hasPermi="['BiobankSys:collection:edit']"
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
          v-hasPermi="['BiobankSys:collection:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:collection:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="collectionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="CRF号" align="center" prop="crfId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="表格填写人" align="center" prop="formCompletedBy" />
      <el-table-column label="表格填写日期" align="center" prop="formCompletionDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.formCompletionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否空腹" align="center" prop="patientFasting" />
      <el-table-column label="最后进食时间" align="center" prop="lastMealTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastMealTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="停药情况" align="center" prop="medicationHold" />
      <el-table-column label="采集时间" align="center" prop="collectionTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.collectionTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="采集并发症" align="center" prop="collectionComplications" />
      <el-table-column label="处理延迟时间" align="center" prop="processingDelayMinutes" />
      <el-table-column label="试样体积" align="center" prop="aliquotVolume" />
      <el-table-column label="试样类型" align="center" prop="additiveType" />
      <el-table-column label="采集者签名" align="center" prop="collectorSignature" />
      <el-table-column label="监督者签名" align="center" prop="supervisorSignature" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:collection:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:collection:remove']"
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

    <!-- 添加或修改CRF表格对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="表格填写人" prop="formCompletedBy">
          <el-input v-model="form.formCompletedBy" placeholder="请输入表格填写人" />
        </el-form-item>
        <el-form-item label="表格填写日期" prop="formCompletionDate">
          <el-date-picker clearable
            v-model="form.formCompletionDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择表格填写日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="是否空腹" prop="patientFasting">
          <el-input v-model="form.patientFasting" placeholder="请输入是否空腹" />
        </el-form-item>
        <el-form-item label="最后进食时间" prop="lastMealTime">
          <el-date-picker clearable
            v-model="form.lastMealTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择最后进食时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="停药情况" prop="medicationHold">
          <el-input v-model="form.medicationHold" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="采集时间" prop="collectionTime">
          <el-date-picker clearable
            v-model="form.collectionTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择采集时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="采集并发症" prop="collectionComplications">
          <el-input v-model="form.collectionComplications" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="处理延迟时间" prop="processingDelayMinutes">
          <el-input v-model="form.processingDelayMinutes" placeholder="请输入处理延迟时间" />
        </el-form-item>
        <el-form-item label="试样体积" prop="aliquotVolume">
          <el-input v-model="form.aliquotVolume" placeholder="请输入试样体积" />
        </el-form-item>
        <el-form-item label="试样类型" prop="additiveType">
          <el-input v-model="form.additiveType" placeholder="请输入试样类型" />
        </el-form-item>
        <el-form-item label="采集者签名" prop="collectorSignature">
          <el-input v-model="form.collectorSignature" placeholder="请输入采集者签名" />
        </el-form-item>
        <el-form-item label="监督者签名" prop="supervisorSignature">
          <el-input v-model="form.supervisorSignature" placeholder="请输入监督者签名" />
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
import { listCollection, getCollection, delCollection, addCollection, updateCollection } from "@/api/BiobankSys/collection"

export default {
  name: "Collection",
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
      // CRF表格表格数据
      collectionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        specimenId: [
          { required: true, message: "样本号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询CRF表格列表 */
    getList() {
      this.loading = true
      listCollection(this.queryParams).then(response => {
        this.collectionList = response.rows
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
        crfId: null,
        specimenId: null,
        formCompletedBy: null,
        formCompletionDate: null,
        patientFasting: null,
        lastMealTime: null,
        medicationHold: null,
        collectionTime: null,
        collectionComplications: null,
        processingDelayMinutes: null,
        aliquotVolume: null,
        additiveType: null,
        collectorSignature: null,
        supervisorSignature: null
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
      this.ids = selection.map(item => item.crfId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加CRF表格"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const crfId = row.crfId || this.ids
      getCollection(crfId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改CRF表格"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.crfId != null) {
            updateCollection(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addCollection(this.form).then(response => {
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
      const crfIds = row.crfId || this.ids
      this.$modal.confirm('是否确认删除CRF表格编号为"' + crfIds + '"的数据项？').then(function() {
        return delCollection(crfIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/collection/export', {
        ...this.queryParams
      }, `collection_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
