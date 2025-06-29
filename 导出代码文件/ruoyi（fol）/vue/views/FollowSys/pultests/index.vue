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
          v-hasPermi="['FollowSys:pultests:add']"
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
          v-hasPermi="['FollowSys:pultests:edit']"
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
          v-hasPermi="['FollowSys:pultests:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:pultests:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pultestsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="肺功能号" align="center" prop="testId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="肺功能测试日期" align="center" prop="lungTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lungTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="IC" align="center" prop="ic" />
      <el-table-column label="MEF50" align="center" prop="mef50" />
      <el-table-column label="FEV1" align="center" prop="fev1" />
      <el-table-column label="FCV" align="center" prop="fvc" />
      <el-table-column label="MMEF75/25" align="center" prop="mmef7525" />
      <el-table-column label="FEV1/FVC" align="center" prop="fev1FvcRatio" />
      <el-table-column label="MEF25" align="center" prop="mef25" />
      <el-table-column label="MEF75" align="center" prop="mef75" />
      <el-table-column label="MVV" align="center" prop="mvv" />
      <el-table-column label="FEV1/VCmax" align="center" prop="fev1VcmaxRatio" />
      <el-table-column label="VCmax" align="center" prop="vcmax" />
      <el-table-column label="结论" align="center" prop="lungFunctionConclusion" />
      <el-table-column label="支气管舒张检查日期" align="center" prop="bronchodilationTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bronchodilationTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支气管舒张检查结果" align="center" prop="bronchodilationResult" />
      <el-table-column label="支气管激发检查日期" align="center" prop="bronchialChallengeTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bronchialChallengeTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支气管激发检查结果" align="center" prop="bronchialChallengeResult" />
      <el-table-column label="潮气肺功能检查日期" align="center" prop="tidalTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.tidalTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="WT" align="center" prop="wtPerKg" />
      <el-table-column label="RR" align="center" prop="rr" />
      <el-table-column label="TI" align="center" prop="ti" />
      <el-table-column label="TE" align="center" prop="te" />
      <el-table-column label="TI/TE" align="center" prop="tiTeRatio" />
      <el-table-column label="TPTEF" align="center" prop="tptef" />
      <el-table-column label="VPTEF" align="center" prop="vptef" />
      <el-table-column label="TPTEF/TE" align="center" prop="tptefTeRatio" />
      <el-table-column label="VPEF/VE" align="center" prop="vpefVeRatio" />
      <el-table-column label="PTEF" align="center" prop="ptef" />
      <el-table-column label="TEF50/TIF50" align="center" prop="tef50Tif50Ratio" />
      <el-table-column label="TEF50" align="center" prop="tef50" />
      <el-table-column label="TEF25" align="center" prop="tef25" />
      <el-table-column label="TEF25-75" align="center" prop="tef2575" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:pultests:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:pultests:remove']"
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

    <!-- 添加或修改肺功能检查对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="肺功能测试日期" prop="lungTestDate">
          <el-date-picker clearable
            v-model="form.lungTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择肺功能测试日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="IC" prop="ic">
          <el-input v-model="form.ic" placeholder="请输入IC" />
        </el-form-item>
        <el-form-item label="MEF50" prop="mef50">
          <el-input v-model="form.mef50" placeholder="请输入MEF50" />
        </el-form-item>
        <el-form-item label="FEV1" prop="fev1">
          <el-input v-model="form.fev1" placeholder="请输入FEV1" />
        </el-form-item>
        <el-form-item label="FCV" prop="fvc">
          <el-input v-model="form.fvc" placeholder="请输入FCV" />
        </el-form-item>
        <el-form-item label="MMEF75/25" prop="mmef7525">
          <el-input v-model="form.mmef7525" placeholder="请输入MMEF75/25" />
        </el-form-item>
        <el-form-item label="FEV1/FVC" prop="fev1FvcRatio">
          <el-input v-model="form.fev1FvcRatio" placeholder="请输入FEV1/FVC" />
        </el-form-item>
        <el-form-item label="MEF25" prop="mef25">
          <el-input v-model="form.mef25" placeholder="请输入MEF25" />
        </el-form-item>
        <el-form-item label="MEF75" prop="mef75">
          <el-input v-model="form.mef75" placeholder="请输入MEF75" />
        </el-form-item>
        <el-form-item label="MVV" prop="mvv">
          <el-input v-model="form.mvv" placeholder="请输入MVV" />
        </el-form-item>
        <el-form-item label="FEV1/VCmax" prop="fev1VcmaxRatio">
          <el-input v-model="form.fev1VcmaxRatio" placeholder="请输入FEV1/VCmax" />
        </el-form-item>
        <el-form-item label="VCmax" prop="vcmax">
          <el-input v-model="form.vcmax" placeholder="请输入VCmax" />
        </el-form-item>
        <el-form-item label="结论" prop="lungFunctionConclusion">
          <el-input v-model="form.lungFunctionConclusion" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="支气管舒张检查日期" prop="bronchodilationTestDate">
          <el-date-picker clearable
            v-model="form.bronchodilationTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择支气管舒张检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支气管舒张检查结果" prop="bronchodilationResult">
          <el-input v-model="form.bronchodilationResult" placeholder="请输入支气管舒张检查结果" />
        </el-form-item>
        <el-form-item label="支气管激发检查日期" prop="bronchialChallengeTestDate">
          <el-date-picker clearable
            v-model="form.bronchialChallengeTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择支气管激发检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支气管激发检查结果" prop="bronchialChallengeResult">
          <el-input v-model="form.bronchialChallengeResult" placeholder="请输入支气管激发检查结果" />
        </el-form-item>
        <el-form-item label="潮气肺功能检查日期" prop="tidalTestDate">
          <el-date-picker clearable
            v-model="form.tidalTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择潮气肺功能检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="WT" prop="wtPerKg">
          <el-input v-model="form.wtPerKg" placeholder="请输入WT" />
        </el-form-item>
        <el-form-item label="RR" prop="rr">
          <el-input v-model="form.rr" placeholder="请输入RR" />
        </el-form-item>
        <el-form-item label="TI" prop="ti">
          <el-input v-model="form.ti" placeholder="请输入TI" />
        </el-form-item>
        <el-form-item label="TE" prop="te">
          <el-input v-model="form.te" placeholder="请输入TE" />
        </el-form-item>
        <el-form-item label="TI/TE" prop="tiTeRatio">
          <el-input v-model="form.tiTeRatio" placeholder="请输入TI/TE" />
        </el-form-item>
        <el-form-item label="TPTEF" prop="tptef">
          <el-input v-model="form.tptef" placeholder="请输入TPTEF" />
        </el-form-item>
        <el-form-item label="VPTEF" prop="vptef">
          <el-input v-model="form.vptef" placeholder="请输入VPTEF" />
        </el-form-item>
        <el-form-item label="TPTEF/TE" prop="tptefTeRatio">
          <el-input v-model="form.tptefTeRatio" placeholder="请输入TPTEF/TE" />
        </el-form-item>
        <el-form-item label="VPEF/VE" prop="vpefVeRatio">
          <el-input v-model="form.vpefVeRatio" placeholder="请输入VPEF/VE" />
        </el-form-item>
        <el-form-item label="PTEF" prop="ptef">
          <el-input v-model="form.ptef" placeholder="请输入PTEF" />
        </el-form-item>
        <el-form-item label="TEF50/TIF50" prop="tef50Tif50Ratio">
          <el-input v-model="form.tef50Tif50Ratio" placeholder="请输入TEF50/TIF50" />
        </el-form-item>
        <el-form-item label="TEF50" prop="tef50">
          <el-input v-model="form.tef50" placeholder="请输入TEF50" />
        </el-form-item>
        <el-form-item label="TEF25" prop="tef25">
          <el-input v-model="form.tef25" placeholder="请输入TEF25" />
        </el-form-item>
        <el-form-item label="TEF25-75" prop="tef2575">
          <el-input v-model="form.tef2575" placeholder="请输入TEF25-75" />
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
import { listPultests, getPultests, delPultests, addPultests, updatePultests } from "@/api/FollowSys/pultests"

export default {
  name: "Pultests",
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
      // 肺功能检查表格数据
      pultestsList: [],
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
    /** 查询肺功能检查列表 */
    getList() {
      this.loading = true
      listPultests(this.queryParams).then(response => {
        this.pultestsList = response.rows
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
        testId: null,
        followupId: null,
        lungTestDate: null,
        ic: null,
        mef50: null,
        fev1: null,
        fvc: null,
        mmef7525: null,
        fev1FvcRatio: null,
        mef25: null,
        mef75: null,
        mvv: null,
        fev1VcmaxRatio: null,
        vcmax: null,
        lungFunctionConclusion: null,
        bronchodilationTestDate: null,
        bronchodilationResult: null,
        bronchialChallengeTestDate: null,
        bronchialChallengeResult: null,
        tidalTestDate: null,
        wtPerKg: null,
        rr: null,
        ti: null,
        te: null,
        tiTeRatio: null,
        tptef: null,
        vptef: null,
        tptefTeRatio: null,
        vpefVeRatio: null,
        ptef: null,
        tef50Tif50Ratio: null,
        tef50: null,
        tef25: null,
        tef2575: null
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
      this.ids = selection.map(item => item.testId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加肺功能检查"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const testId = row.testId || this.ids
      getPultests(testId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改肺功能检查"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.testId != null) {
            updatePultests(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addPultests(this.form).then(response => {
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
      const testIds = row.testId || this.ids
      this.$modal.confirm('是否确认删除肺功能检查编号为"' + testIds + '"的数据项？').then(function() {
        return delPultests(testIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/pultests/export', {
        ...this.queryParams
      }, `pultests_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
