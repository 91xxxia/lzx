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
          v-hasPermi="['FollowSys:diagnoses:add']"
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
          v-hasPermi="['FollowSys:diagnoses:edit']"
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
          v-hasPermi="['FollowSys:diagnoses:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:diagnoses:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="diagnosesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="诊断号" align="center" prop="diagnosisId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="诊断日期" align="center" prop="diagnosisDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.diagnosisDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="哮喘阶段" align="center" prop="asthmaPhase" />
      <el-table-column label="哮喘严重程度" align="center" prop="asthmaSeverity" />
      <el-table-column label="鼻炎严重程度" align="center" prop="rhinitisSeverity" />
      <el-table-column label="鼻炎类型" align="center" prop="rhinitisType" />
      <el-table-column label="鼻炎持续时间" align="center" prop="rhinitisDuration" />
      <el-table-column label="特应性皮炎" align="center" prop="dermatitisPresent" />
      <el-table-column label="皮炎严重程度" align="center" prop="dermatitisSeverity" />
      <el-table-column label="鼻窦炎阶段" align="center" prop="sinusitisPhase" />
      <el-table-column label="腺样体肥大" align="center" prop="adenoidHypertrophy" />
      <el-table-column label="扁桃体肥大" align="center" prop="tonsilHypertrophy" />
      <el-table-column label="鼾症" align="center" prop="snoring" />
      <el-table-column label="阻塞性呼吸睡眠暂停低通气综合征" align="center" prop="osaHypopneaSyndrome" />
      <el-table-column label="过敏性结膜炎" align="center" prop="allergicConjunctivitis" />
      <el-table-column label="其他" align="center" prop="otherDiagnoses" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:diagnoses:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:diagnoses:remove']"
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

    <!-- 添加或修改疾病诊断对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="诊断日期" prop="diagnosisDate">
          <el-date-picker clearable
            v-model="form.diagnosisDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择诊断日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="哮喘阶段" prop="asthmaPhase">
          <el-input v-model="form.asthmaPhase" placeholder="请输入哮喘阶段" />
        </el-form-item>
        <el-form-item label="哮喘严重程度" prop="asthmaSeverity">
          <el-input v-model="form.asthmaSeverity" placeholder="请输入哮喘严重程度" />
        </el-form-item>
        <el-form-item label="鼻炎严重程度" prop="rhinitisSeverity">
          <el-input v-model="form.rhinitisSeverity" placeholder="请输入鼻炎严重程度" />
        </el-form-item>
        <el-form-item label="鼻炎类型" prop="rhinitisType">
          <el-input v-model="form.rhinitisType" placeholder="请输入鼻炎类型" />
        </el-form-item>
        <el-form-item label="鼻炎持续时间" prop="rhinitisDuration">
          <el-input v-model="form.rhinitisDuration" placeholder="请输入鼻炎持续时间" />
        </el-form-item>
        <el-form-item label="特应性皮炎" prop="dermatitisPresent">
          <el-input v-model="form.dermatitisPresent" placeholder="请输入特应性皮炎" />
        </el-form-item>
        <el-form-item label="皮炎严重程度" prop="dermatitisSeverity">
          <el-input v-model="form.dermatitisSeverity" placeholder="请输入皮炎严重程度" />
        </el-form-item>
        <el-form-item label="鼻窦炎阶段" prop="sinusitisPhase">
          <el-input v-model="form.sinusitisPhase" placeholder="请输入鼻窦炎阶段" />
        </el-form-item>
        <el-form-item label="腺样体肥大" prop="adenoidHypertrophy">
          <el-input v-model="form.adenoidHypertrophy" placeholder="请输入腺样体肥大" />
        </el-form-item>
        <el-form-item label="扁桃体肥大" prop="tonsilHypertrophy">
          <el-input v-model="form.tonsilHypertrophy" placeholder="请输入扁桃体肥大" />
        </el-form-item>
        <el-form-item label="鼾症" prop="snoring">
          <el-input v-model="form.snoring" placeholder="请输入鼾症" />
        </el-form-item>
        <el-form-item label="阻塞性呼吸睡眠暂停低通气综合征" prop="osaHypopneaSyndrome">
          <el-input v-model="form.osaHypopneaSyndrome" placeholder="请输入阻塞性呼吸睡眠暂停低通气综合征" />
        </el-form-item>
        <el-form-item label="过敏性结膜炎" prop="allergicConjunctivitis">
          <el-input v-model="form.allergicConjunctivitis" placeholder="请输入过敏性结膜炎" />
        </el-form-item>
        <el-form-item label="其他" prop="otherDiagnoses">
          <el-input v-model="form.otherDiagnoses" type="textarea" placeholder="请输入内容" />
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
import { listDiagnoses, getDiagnoses, delDiagnoses, addDiagnoses, updateDiagnoses } from "@/api/FollowSys/diagnoses"

export default {
  name: "Diagnoses",
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
      // 疾病诊断表格数据
      diagnosesList: [],
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
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询疾病诊断列表 */
    getList() {
      this.loading = true
      listDiagnoses(this.queryParams).then(response => {
        this.diagnosesList = response.rows
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
        diagnosisId: null,
        followupId: null,
        diagnosisDate: null,
        asthmaPhase: null,
        asthmaSeverity: null,
        rhinitisSeverity: null,
        rhinitisType: null,
        rhinitisDuration: null,
        dermatitisPresent: null,
        dermatitisSeverity: null,
        sinusitisPhase: null,
        adenoidHypertrophy: null,
        tonsilHypertrophy: null,
        snoring: null,
        osaHypopneaSyndrome: null,
        allergicConjunctivitis: null,
        otherDiagnoses: null
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
      this.ids = selection.map(item => item.diagnosisId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加疾病诊断"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const diagnosisId = row.diagnosisId || this.ids
      getDiagnoses(diagnosisId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改疾病诊断"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.diagnosisId != null) {
            updateDiagnoses(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addDiagnoses(this.form).then(response => {
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
      const diagnosisIds = row.diagnosisId || this.ids
      this.$modal.confirm('是否确认删除疾病诊断编号为"' + diagnosisIds + '"的数据项？').then(function() {
        return delDiagnoses(diagnosisIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/diagnoses/export', {
        ...this.queryParams
      }, `diagnoses_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
