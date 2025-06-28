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
      <el-form-item label="质量分析日期" prop="qcDate">
        <el-date-picker clearable
          v-model="queryParams.qcDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择质量分析日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="dna浓度" prop="dnaConcentration">
        <el-input
          v-model="queryParams.dnaConcentration"
          placeholder="请输入dna浓度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="dna质量比(A260/A280)" prop="dnaQualityRatio">
        <el-input
          v-model="queryParams.dnaQualityRatio"
          placeholder="请输入dna质量比(A260/A280)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="RIN值" prop="rnaIntegrityNumber">
        <el-input
          v-model="queryParams.rnaIntegrityNumber"
          placeholder="请输入RIN值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="蛋白质浓度" prop="proteinConcentration">
        <el-input
          v-model="queryParams.proteinConcentration"
          placeholder="请输入蛋白质浓度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="污染状态" prop="contaminationStatus">
        <el-input
          v-model="queryParams.contaminationStatus"
          placeholder="请输入污染状态"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="qcOperator">
        <el-input
          v-model="queryParams.qcOperator"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="qcMethod">
        <el-input
          v-model="queryParams.qcMethod"
          placeholder="请输入${comment}"
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
          v-hasPermi="['BiobankSys:qc:add']"
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
          v-hasPermi="['BiobankSys:qc:edit']"
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
          v-hasPermi="['BiobankSys:qc:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:qc:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="qcList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="质量分析号" align="center" prop="qcId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="质量分析日期" align="center" prop="qcDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.qcDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="dna浓度" align="center" prop="dnaConcentration" />
      <el-table-column label="dna质量比(A260/A280)" align="center" prop="dnaQualityRatio" />
      <el-table-column label="RIN值" align="center" prop="rnaIntegrityNumber" />
      <el-table-column label="蛋白质浓度" align="center" prop="proteinConcentration" />
      <el-table-column label="溶血水平" align="center" prop="hemolysisLevel" />
      <el-table-column label="污染状态" align="center" prop="contaminationStatus" />
      <el-table-column label="${comment}" align="center" prop="qcOperator" />
      <el-table-column label="${comment}" align="center" prop="qcMethod" />
      <el-table-column label="${comment}" align="center" prop="qcNotes" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:qc:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:qc:remove']"
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

    <!-- 添加或修改样本质量控表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="质量分析日期" prop="qcDate">
          <el-date-picker clearable
            v-model="form.qcDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择质量分析日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="dna浓度" prop="dnaConcentration">
          <el-input v-model="form.dnaConcentration" placeholder="请输入dna浓度" />
        </el-form-item>
        <el-form-item label="dna质量比(A260/A280)" prop="dnaQualityRatio">
          <el-input v-model="form.dnaQualityRatio" placeholder="请输入dna质量比(A260/A280)" />
        </el-form-item>
        <el-form-item label="RIN值" prop="rnaIntegrityNumber">
          <el-input v-model="form.rnaIntegrityNumber" placeholder="请输入RIN值" />
        </el-form-item>
        <el-form-item label="蛋白质浓度" prop="proteinConcentration">
          <el-input v-model="form.proteinConcentration" placeholder="请输入蛋白质浓度" />
        </el-form-item>
        <el-form-item label="污染状态" prop="contaminationStatus">
          <el-input v-model="form.contaminationStatus" placeholder="请输入污染状态" />
        </el-form-item>
        <el-form-item label="${comment}" prop="qcOperator">
          <el-input v-model="form.qcOperator" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="qcMethod">
          <el-input v-model="form.qcMethod" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="qcNotes">
          <el-input v-model="form.qcNotes" type="textarea" placeholder="请输入内容" />
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
import { listQc, getQc, delQc, addQc, updateQc } from "@/api/BiobankSys/qc"

export default {
  name: "Qc",
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
      // 样本质量控表表格数据
      qcList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
        qcDate: null,
        dnaConcentration: null,
        dnaQualityRatio: null,
        rnaIntegrityNumber: null,
        proteinConcentration: null,
        hemolysisLevel: null,
        contaminationStatus: null,
        qcOperator: null,
        qcMethod: null,
        qcNotes: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        specimenId: [
          { required: true, message: "样本号不能为空", trigger: "blur" }
        ],
        qcDate: [
          { required: true, message: "质量分析日期不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询样本质量控表列表 */
    getList() {
      this.loading = true
      listQc(this.queryParams).then(response => {
        this.qcList = response.rows
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
        qcId: null,
        specimenId: null,
        qcDate: null,
        dnaConcentration: null,
        dnaQualityRatio: null,
        rnaIntegrityNumber: null,
        proteinConcentration: null,
        hemolysisLevel: null,
        contaminationStatus: null,
        qcOperator: null,
        qcMethod: null,
        qcNotes: null
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
      this.ids = selection.map(item => item.qcId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本质量控表"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const qcId = row.qcId || this.ids
      getQc(qcId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改样本质量控表"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.qcId != null) {
            updateQc(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addQc(this.form).then(response => {
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
      const qcIds = row.qcId || this.ids
      this.$modal.confirm('是否确认删除样本质量控表编号为"' + qcIds + '"的数据项？').then(function() {
        return delQc(qcIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/qc/export', {
        ...this.queryParams
      }, `qc_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
