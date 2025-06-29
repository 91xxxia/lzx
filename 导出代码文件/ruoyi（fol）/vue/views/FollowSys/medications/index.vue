<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="随访号" prop="followupId">
        <el-input
          v-model="queryParams.followupId"
          placeholder="请输入随访号"
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
          v-hasPermi="['FollowSys:medications:add']"
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
          v-hasPermi="['FollowSys:medications:edit']"
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
          v-hasPermi="['FollowSys:medications:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:medications:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicationsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用号" align="center" prop="medId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="药物号" align="center" prop="drugId" />
      <el-table-column label="剂量" align="center" prop="dose" />
      <el-table-column label="给药频率" align="center" prop="frequency" />
      <el-table-column label="给药途径" align="center" prop="route" />
      <el-table-column label="给药部位" align="center" prop="site" />
      <el-table-column label="治疗开始时间" align="center" prop="startDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="治疗终止时间" align="center" prop="endDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="用药指导" align="center" prop="guidance" />
      <el-table-column label="用药注意事项" align="center" prop="precautions" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:medications:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:medications:remove']"
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

    <!-- 添加或修改用药对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="药物号" prop="drugId">
          <el-input v-model="form.drugId" placeholder="请输入药物号" />
        </el-form-item>
        <el-form-item label="剂量" prop="dose">
          <el-input v-model="form.dose" placeholder="请输入剂量" />
        </el-form-item>
        <el-form-item label="给药频率" prop="frequency">
          <el-input v-model="form.frequency" placeholder="请输入给药频率" />
        </el-form-item>
        <el-form-item label="给药途径" prop="route">
          <el-input v-model="form.route" placeholder="请输入给药途径" />
        </el-form-item>
        <el-form-item label="给药部位" prop="site">
          <el-input v-model="form.site" placeholder="请输入给药部位" />
        </el-form-item>
        <el-form-item label="治疗开始时间" prop="startDate">
          <el-date-picker clearable
            v-model="form.startDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择治疗开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="治疗终止时间" prop="endDate">
          <el-date-picker clearable
            v-model="form.endDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择治疗终止时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="用药指导" prop="guidance">
          <el-input v-model="form.guidance" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="用药注意事项" prop="precautions">
          <el-input v-model="form.precautions" type="textarea" placeholder="请输入内容" />
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
import { listMedications, getMedications, delMedications, addMedications, updateMedications } from "@/api/FollowSys/medications"

export default {
  name: "Medications",
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
      // 用药表格数据
      medicationsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        followupId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        followupId: [
          { required: true, message: "随访号不能为空", trigger: "blur" }
        ],
        drugId: [
          { required: true, message: "药物号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询用药列表 */
    getList() {
      this.loading = true
      listMedications(this.queryParams).then(response => {
        this.medicationsList = response.rows
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
        medId: null,
        followupId: null,
        drugId: null,
        dose: null,
        frequency: null,
        route: null,
        site: null,
        startDate: null,
        endDate: null,
        guidance: null,
        precautions: null
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
      this.ids = selection.map(item => item.medId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加用药"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const medId = row.medId || this.ids
      getMedications(medId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改用药"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.medId != null) {
            updateMedications(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMedications(this.form).then(response => {
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
      const medIds = row.medId || this.ids
      this.$modal.confirm('是否确认删除用药编号为"' + medIds + '"的数据项？').then(function() {
        return delMedications(medIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/medications/export', {
        ...this.queryParams
      }, `medications_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
