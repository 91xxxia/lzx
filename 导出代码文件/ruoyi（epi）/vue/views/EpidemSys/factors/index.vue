<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="患者号" prop="surveyId">
        <el-input
          v-model="queryParams.surveyId"
          placeholder="请输入患者号"
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
          v-hasPermi="['EpidemSys:factors:add']"
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
          v-hasPermi="['EpidemSys:factors:edit']"
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
          v-hasPermi="['EpidemSys:factors:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:factors:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="factorsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="其他因素号" align="center" prop="confoundId" />
      <el-table-column label="患者号" align="center" prop="surveyId" />
      <el-table-column label="饮食习惯" align="center" prop="dietType" />
      <el-table-column label="每日摄入维生素D400u" align="center" prop="vitaminD400u" />
      <el-table-column label="口服周期" align="center" prop="vitaminDYears" />
      <el-table-column label="Omega-3摄入量" align="center" prop="omega3Intake" />
      <el-table-column label="长期压力水平" align="center" prop="stressLevelPss10" />
      <el-table-column label="焦虑或抑郁状态" align="center" prop="mentalStatePhq9Gad7" />
      <el-table-column label="按计划接种" align="center" prop="vaccineOnSchedule" />
      <el-table-column label="抗生素使用频率" align="center" prop="antibioticFreq" />
      <el-table-column label="母乳喂养" align="center" prop="breastfeeding" />
      <el-table-column label="具体月数" align="center" prop="breastfeedingMonths" />
      <el-table-column label="分娩情况" align="center" prop="deliveryType" />
      <el-table-column label="宠物接触年龄" align="center" prop="petExposureStage" />
      <el-table-column label="农场环境暴露" align="center" prop="farmExposure" />
      <el-table-column label="具体月数" align="center" prop="farmExposureMonths" />
      <el-table-column label="缺课天数" align="center" prop="absentDaysAllergy" />
      <el-table-column label="每年人均医疗费用支出" align="center" prop="annualMedicalCost" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:factors:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:factors:remove']"
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

    <!-- 添加或修改其他潜在混杂因素对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者号" prop="surveyId">
          <el-input v-model="form.surveyId" placeholder="请输入患者号" />
        </el-form-item>
        <el-form-item label="饮食习惯" prop="dietType">
          <el-input v-model="form.dietType" placeholder="请输入饮食习惯" />
        </el-form-item>
        <el-form-item label="每日摄入维生素D400u" prop="vitaminD400u">
          <el-input v-model="form.vitaminD400u" placeholder="请输入每日摄入维生素D400u" />
        </el-form-item>
        <el-form-item label="口服周期" prop="vitaminDYears">
          <el-input v-model="form.vitaminDYears" placeholder="请输入口服周期" />
        </el-form-item>
        <el-form-item label="Omega-3摄入量" prop="omega3Intake">
          <el-input v-model="form.omega3Intake" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="长期压力水平" prop="stressLevelPss10">
          <el-input v-model="form.stressLevelPss10" placeholder="请输入长期压力水平" />
        </el-form-item>
        <el-form-item label="焦虑或抑郁状态" prop="mentalStatePhq9Gad7">
          <el-input v-model="form.mentalStatePhq9Gad7" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="按计划接种" prop="vaccineOnSchedule">
          <el-input v-model="form.vaccineOnSchedule" placeholder="请输入按计划接种" />
        </el-form-item>
        <el-form-item label="抗生素使用频率" prop="antibioticFreq">
          <el-input v-model="form.antibioticFreq" placeholder="请输入抗生素使用频率" />
        </el-form-item>
        <el-form-item label="母乳喂养" prop="breastfeeding">
          <el-input v-model="form.breastfeeding" placeholder="请输入母乳喂养" />
        </el-form-item>
        <el-form-item label="具体月数" prop="breastfeedingMonths">
          <el-input v-model="form.breastfeedingMonths" placeholder="请输入具体月数" />
        </el-form-item>
        <el-form-item label="分娩情况" prop="deliveryType">
          <el-input v-model="form.deliveryType" placeholder="请输入分娩情况" />
        </el-form-item>
        <el-form-item label="宠物接触年龄" prop="petExposureStage">
          <el-input v-model="form.petExposureStage" placeholder="请输入宠物接触年龄" />
        </el-form-item>
        <el-form-item label="农场环境暴露" prop="farmExposure">
          <el-input v-model="form.farmExposure" placeholder="请输入农场环境暴露" />
        </el-form-item>
        <el-form-item label="具体月数" prop="farmExposureMonths">
          <el-input v-model="form.farmExposureMonths" placeholder="请输入具体月数" />
        </el-form-item>
        <el-form-item label="缺课天数" prop="absentDaysAllergy">
          <el-input v-model="form.absentDaysAllergy" placeholder="请输入缺课天数" />
        </el-form-item>
        <el-form-item label="每年人均医疗费用支出" prop="annualMedicalCost">
          <el-input v-model="form.annualMedicalCost" placeholder="请输入每年人均医疗费用支出" />
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
import { listFactors, getFactors, delFactors, addFactors, updateFactors } from "@/api/EpidemSys/factors"

export default {
  name: "Factors",
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
      // 其他潜在混杂因素表格数据
      factorsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        surveyId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        surveyId: [
          { required: true, message: "患者号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询其他潜在混杂因素列表 */
    getList() {
      this.loading = true
      listFactors(this.queryParams).then(response => {
        this.factorsList = response.rows
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
        confoundId: null,
        surveyId: null,
        dietType: null,
        vitaminD400u: null,
        vitaminDYears: null,
        omega3Intake: null,
        stressLevelPss10: null,
        mentalStatePhq9Gad7: null,
        vaccineOnSchedule: null,
        antibioticFreq: null,
        breastfeeding: null,
        breastfeedingMonths: null,
        deliveryType: null,
        petExposureStage: null,
        farmExposure: null,
        farmExposureMonths: null,
        absentDaysAllergy: null,
        annualMedicalCost: null
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
      this.ids = selection.map(item => item.confoundId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加其他潜在混杂因素"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const confoundId = row.confoundId || this.ids
      getFactors(confoundId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改其他潜在混杂因素"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.confoundId != null) {
            updateFactors(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addFactors(this.form).then(response => {
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
      const confoundIds = row.confoundId || this.ids
      this.$modal.confirm('是否确认删除其他潜在混杂因素编号为"' + confoundIds + '"的数据项？').then(function() {
        return delFactors(confoundIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/factors/export', {
        ...this.queryParams
      }, `factors_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
