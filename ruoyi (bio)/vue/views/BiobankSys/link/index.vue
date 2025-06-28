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
      <el-form-item label="关联临床诊断ID" prop="clinicalDiagnosisId">
        <el-input
          v-model="queryParams.clinicalDiagnosisId"
          placeholder="请输入关联临床诊断ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联临床症状ID" prop="clinicalSymptomId">
        <el-input
          v-model="queryParams.clinicalSymptomId"
          placeholder="请输入关联临床症状ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联临床用药ID" prop="clinicalMedicationId">
        <el-input
          v-model="queryParams.clinicalMedicationId"
          placeholder="请输入关联临床用药ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联临床检查ID" prop="clinicalTestId">
        <el-input
          v-model="queryParams.clinicalTestId"
          placeholder="请输入关联临床检查ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联类型" prop="linkType">
        <el-input
          v-model="queryParams.linkType"
          placeholder="请输入关联类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="临床记录" prop="clinicalNotes">
        <el-input
          v-model="queryParams.clinicalNotes"
          placeholder="请输入临床记录"
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
          v-hasPermi="['BiobankSys:link:add']"
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
          v-hasPermi="['BiobankSys:link:edit']"
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
          v-hasPermi="['BiobankSys:link:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:link:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="linkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="关联号" align="center" prop="linkId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="关联临床诊断ID" align="center" prop="clinicalDiagnosisId" />
      <el-table-column label="关联临床症状ID" align="center" prop="clinicalSymptomId" />
      <el-table-column label="关联临床用药ID" align="center" prop="clinicalMedicationId" />
      <el-table-column label="关联临床检查ID" align="center" prop="clinicalTestId" />
      <el-table-column label="关联类型" align="center" prop="linkType" />
      <el-table-column label="临床记录" align="center" prop="clinicalNotes" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:link:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:link:remove']"
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

    <!-- 添加或修改样本-临床关联对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="关联临床诊断ID" prop="clinicalDiagnosisId">
          <el-input v-model="form.clinicalDiagnosisId" placeholder="请输入关联临床诊断ID" />
        </el-form-item>
        <el-form-item label="关联临床症状ID" prop="clinicalSymptomId">
          <el-input v-model="form.clinicalSymptomId" placeholder="请输入关联临床症状ID" />
        </el-form-item>
        <el-form-item label="关联临床用药ID" prop="clinicalMedicationId">
          <el-input v-model="form.clinicalMedicationId" placeholder="请输入关联临床用药ID" />
        </el-form-item>
        <el-form-item label="关联临床检查ID" prop="clinicalTestId">
          <el-input v-model="form.clinicalTestId" placeholder="请输入关联临床检查ID" />
        </el-form-item>
        <el-form-item label="关联类型" prop="linkType">
          <el-input v-model="form.linkType" placeholder="请输入关联类型" />
        </el-form-item>
        <el-form-item label="临床记录" prop="clinicalNotes">
          <el-input v-model="form.clinicalNotes" placeholder="请输入临床记录" />
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
import { listLink, getLink, delLink, addLink, updateLink } from "@/api/BiobankSys/link"

export default {
  name: "Link",
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
      // 样本-临床关联表格数据
      linkList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
        clinicalDiagnosisId: null,
        clinicalSymptomId: null,
        clinicalMedicationId: null,
        clinicalTestId: null,
        linkType: null,
        clinicalNotes: null
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
    /** 查询样本-临床关联列表 */
    getList() {
      this.loading = true
      listLink(this.queryParams).then(response => {
        this.linkList = response.rows
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
        linkId: null,
        specimenId: null,
        clinicalDiagnosisId: null,
        clinicalSymptomId: null,
        clinicalMedicationId: null,
        clinicalTestId: null,
        linkType: null,
        clinicalNotes: null
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
      this.ids = selection.map(item => item.linkId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本-临床关联"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const linkId = row.linkId || this.ids
      getLink(linkId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改样本-临床关联"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.linkId != null) {
            updateLink(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addLink(this.form).then(response => {
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
      const linkIds = row.linkId || this.ids
      this.$modal.confirm('是否确认删除样本-临床关联编号为"' + linkIds + '"的数据项？').then(function() {
        return delLink(linkIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/link/export', {
        ...this.queryParams
      }, `link_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
