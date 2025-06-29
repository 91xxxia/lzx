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
          v-hasPermi="['FollowSys:exam:add']"
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
          v-hasPermi="['FollowSys:exam:edit']"
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
          v-hasPermi="['FollowSys:exam:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:exam:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="examList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="体征号" align="center" prop="examId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="温度" align="center" prop="temperatureC" />
      <el-table-column label="脉搏" align="center" prop="pulseBpm" />
      <el-table-column label="血氧饱和度" align="center" prop="spo2Percent" />
      <el-table-column label="有无吸氧" align="center" prop="oxygenUsed" />
      <el-table-column label="神志" align="center" prop="consciousness" />
      <el-table-column label="精神" align="center" prop="mentalState" />
      <el-table-column label="呼吸" align="center" prop="breathingPattern" />
      <el-table-column label="外观" align="center" prop="appearance" />
      <el-table-column label="鼻腔黏膜苍白" align="center" prop="nasalMucosaPale" />
      <el-table-column label="鼻腔黏膜水肿" align="center" prop="nasalMucosaEdema" />
      <el-table-column label="鼻腔黏膜肿胀" align="center" prop="nasalMucosaSwelling" />
      <el-table-column label="鼻腔黏膜清涕" align="center" prop="nasalMucosaClearDischarge" />
      <el-table-column label="鼻腔黏膜评分" align="center" prop="nasalScore" />
      <el-table-column label="三凹征" align="center" prop="threeDepressionSign" />
      <el-table-column label="左肺呼吸音" align="center" prop="leftLungSound" />
      <el-table-column label="左肺闻及干啰音" align="center" prop="leftDryRalesPresent" />
      <el-table-column label="左肺闻及干啰音分布" align="center" prop="leftDryRalesDistribution" />
      <el-table-column label="左肺闻及湿啰音" align="center" prop="leftWetRalesPresent" />
      <el-table-column label="左肺闻及湿啰音分布" align="center" prop="leftWetRalesDistribution" />
      <el-table-column label="右肺呼吸音" align="center" prop="rightLungSound" />
      <el-table-column label="右肺闻及干啰音" align="center" prop="rightDryRalesPresent" />
      <el-table-column label="右肺闻及干啰音分布" align="center" prop="rightDryRalesDistribution" />
      <el-table-column label="右肺闻及湿啰音" align="center" prop="rightWetRalesPresent" />
      <el-table-column label="右肺闻及湿啰音分布" align="center" prop="rightWetRalesDistribution" />
      <el-table-column label="心率" align="center" prop="heartRate" />
      <el-table-column label="心律" align="center" prop="heartRhythm" />
      <el-table-column label="心脏闻及杂音" align="center" prop="heartMurmurPresent" />
      <el-table-column label="心脏闻及杂音类型" align="center" prop="heartMurmurType" />
      <el-table-column label="腹" align="center" prop="abdomenShape" />
      <el-table-column label="腹压痛" align="center" prop="abdomenTenderness" />
      <el-table-column label="反跳痛" align="center" prop="reboundTenderness" />
      <el-table-column label="头颈红斑" align="center" prop="headNeckErythema" />
      <el-table-column label="头颈丘疹" align="center" prop="headNeckPapule" />
      <el-table-column label="头颈渗出" align="center" prop="headNeckExudation" />
      <el-table-column label="头颈表皮剥脱" align="center" prop="headNeckDesquamation" />
      <el-table-column label="头颈苔藓样变" align="center" prop="headNeckLichenification" />
      <el-table-column label="头颈干燥" align="center" prop="headNeckDryness" />
      <el-table-column label="头颈其他" align="center" prop="headNeckOther" />
      <el-table-column label="上肢红斑" align="center" prop="upperLimbErythema" />
      <el-table-column label="上肢丘疹" align="center" prop="upperLimbPapule" />
      <el-table-column label="上肢渗出" align="center" prop="upperLimbExudation" />
      <el-table-column label="上肢表皮剥脱" align="center" prop="upperLimbDesquamation" />
      <el-table-column label="上肢苔藓样变" align="center" prop="upperLimbLichenification" />
      <el-table-column label="上肢干燥" align="center" prop="upperLimbDryness" />
      <el-table-column label="上肢其他" align="center" prop="upperLimbOther" />
      <el-table-column label="躯干红斑" align="center" prop="trunkErythema" />
      <el-table-column label="躯干丘疹" align="center" prop="trunkPapule" />
      <el-table-column label="躯干渗出" align="center" prop="trunkExudation" />
      <el-table-column label="躯干表皮剥脱" align="center" prop="trunkDesquamation" />
      <el-table-column label="躯干苔藓样变" align="center" prop="trunkLichenification" />
      <el-table-column label="躯干干燥" align="center" prop="trunkDryness" />
      <el-table-column label="躯干其他" align="center" prop="trunkOther" />
      <el-table-column label="下肢红斑" align="center" prop="lowerLimbErythema" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbPapule" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbExudation" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbDesquamation" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbLichenification" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbDryness" />
      <el-table-column label="${comment}" align="center" prop="lowerLimbOther" />
      <el-table-column label="生殖器红斑" align="center" prop="genitalErythema" />
      <el-table-column label="${comment}" align="center" prop="genitalPapule" />
      <el-table-column label="${comment}" align="center" prop="genitalExudation" />
      <el-table-column label="${comment}" align="center" prop="genitalDesquamation" />
      <el-table-column label="${comment}" align="center" prop="genitalLichenification" />
      <el-table-column label="${comment}" align="center" prop="genitalDryness" />
      <el-table-column label="${comment}" align="center" prop="genitalOther" />
      <el-table-column label="电子呼吸音" align="center" prop="electronicBreathSoundPath" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:exam:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:exam:remove']"
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

    <!-- 添加或修改体征对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="温度" prop="temperatureC">
          <el-input v-model="form.temperatureC" placeholder="请输入温度" />
        </el-form-item>
        <el-form-item label="脉搏" prop="pulseBpm">
          <el-input v-model="form.pulseBpm" placeholder="请输入脉搏" />
        </el-form-item>
        <el-form-item label="血氧饱和度" prop="spo2Percent">
          <el-input v-model="form.spo2Percent" placeholder="请输入血氧饱和度" />
        </el-form-item>
        <el-form-item label="有无吸氧" prop="oxygenUsed">
          <el-input v-model="form.oxygenUsed" placeholder="请输入有无吸氧" />
        </el-form-item>
        <el-form-item label="神志" prop="consciousness">
          <el-input v-model="form.consciousness" placeholder="请输入神志" />
        </el-form-item>
        <el-form-item label="精神" prop="mentalState">
          <el-input v-model="form.mentalState" placeholder="请输入精神" />
        </el-form-item>
        <el-form-item label="呼吸" prop="breathingPattern">
          <el-input v-model="form.breathingPattern" placeholder="请输入呼吸" />
        </el-form-item>
        <el-form-item label="外观" prop="appearance">
          <el-input v-model="form.appearance" placeholder="请输入外观" />
        </el-form-item>
        <el-form-item label="鼻腔黏膜苍白" prop="nasalMucosaPale">
          <el-input v-model="form.nasalMucosaPale" placeholder="请输入鼻腔黏膜苍白" />
        </el-form-item>
        <el-form-item label="鼻腔黏膜水肿" prop="nasalMucosaEdema">
          <el-input v-model="form.nasalMucosaEdema" placeholder="请输入鼻腔黏膜水肿" />
        </el-form-item>
        <el-form-item label="鼻腔黏膜肿胀" prop="nasalMucosaSwelling">
          <el-input v-model="form.nasalMucosaSwelling" placeholder="请输入鼻腔黏膜肿胀" />
        </el-form-item>
        <el-form-item label="鼻腔黏膜清涕" prop="nasalMucosaClearDischarge">
          <el-input v-model="form.nasalMucosaClearDischarge" placeholder="请输入鼻腔黏膜清涕" />
        </el-form-item>
        <el-form-item label="鼻腔黏膜评分" prop="nasalScore">
          <el-input v-model="form.nasalScore" placeholder="请输入鼻腔黏膜评分" />
        </el-form-item>
        <el-form-item label="三凹征" prop="threeDepressionSign">
          <el-input v-model="form.threeDepressionSign" placeholder="请输入三凹征" />
        </el-form-item>
        <el-form-item label="左肺呼吸音" prop="leftLungSound">
          <el-input v-model="form.leftLungSound" placeholder="请输入左肺呼吸音" />
        </el-form-item>
        <el-form-item label="左肺闻及干啰音" prop="leftDryRalesPresent">
          <el-input v-model="form.leftDryRalesPresent" placeholder="请输入左肺闻及干啰音" />
        </el-form-item>
        <el-form-item label="左肺闻及干啰音分布" prop="leftDryRalesDistribution">
          <el-input v-model="form.leftDryRalesDistribution" placeholder="请输入左肺闻及干啰音分布" />
        </el-form-item>
        <el-form-item label="左肺闻及湿啰音" prop="leftWetRalesPresent">
          <el-input v-model="form.leftWetRalesPresent" placeholder="请输入左肺闻及湿啰音" />
        </el-form-item>
        <el-form-item label="左肺闻及湿啰音分布" prop="leftWetRalesDistribution">
          <el-input v-model="form.leftWetRalesDistribution" placeholder="请输入左肺闻及湿啰音分布" />
        </el-form-item>
        <el-form-item label="右肺呼吸音" prop="rightLungSound">
          <el-input v-model="form.rightLungSound" placeholder="请输入右肺呼吸音" />
        </el-form-item>
        <el-form-item label="右肺闻及干啰音" prop="rightDryRalesPresent">
          <el-input v-model="form.rightDryRalesPresent" placeholder="请输入右肺闻及干啰音" />
        </el-form-item>
        <el-form-item label="右肺闻及干啰音分布" prop="rightDryRalesDistribution">
          <el-input v-model="form.rightDryRalesDistribution" placeholder="请输入右肺闻及干啰音分布" />
        </el-form-item>
        <el-form-item label="右肺闻及湿啰音" prop="rightWetRalesPresent">
          <el-input v-model="form.rightWetRalesPresent" placeholder="请输入右肺闻及湿啰音" />
        </el-form-item>
        <el-form-item label="右肺闻及湿啰音分布" prop="rightWetRalesDistribution">
          <el-input v-model="form.rightWetRalesDistribution" placeholder="请输入右肺闻及湿啰音分布" />
        </el-form-item>
        <el-form-item label="心率" prop="heartRate">
          <el-input v-model="form.heartRate" placeholder="请输入心率" />
        </el-form-item>
        <el-form-item label="心律" prop="heartRhythm">
          <el-input v-model="form.heartRhythm" placeholder="请输入心律" />
        </el-form-item>
        <el-form-item label="心脏闻及杂音" prop="heartMurmurPresent">
          <el-input v-model="form.heartMurmurPresent" placeholder="请输入心脏闻及杂音" />
        </el-form-item>
        <el-form-item label="心脏闻及杂音类型" prop="heartMurmurType">
          <el-input v-model="form.heartMurmurType" placeholder="请输入心脏闻及杂音类型" />
        </el-form-item>
        <el-form-item label="腹" prop="abdomenShape">
          <el-input v-model="form.abdomenShape" placeholder="请输入腹" />
        </el-form-item>
        <el-form-item label="腹压痛" prop="abdomenTenderness">
          <el-input v-model="form.abdomenTenderness" placeholder="请输入腹压痛" />
        </el-form-item>
        <el-form-item label="反跳痛" prop="reboundTenderness">
          <el-input v-model="form.reboundTenderness" placeholder="请输入反跳痛" />
        </el-form-item>
        <el-form-item label="头颈红斑" prop="headNeckErythema">
          <el-input v-model="form.headNeckErythema" placeholder="请输入头颈红斑" />
        </el-form-item>
        <el-form-item label="头颈丘疹" prop="headNeckPapule">
          <el-input v-model="form.headNeckPapule" placeholder="请输入头颈丘疹" />
        </el-form-item>
        <el-form-item label="头颈渗出" prop="headNeckExudation">
          <el-input v-model="form.headNeckExudation" placeholder="请输入头颈渗出" />
        </el-form-item>
        <el-form-item label="头颈表皮剥脱" prop="headNeckDesquamation">
          <el-input v-model="form.headNeckDesquamation" placeholder="请输入头颈表皮剥脱" />
        </el-form-item>
        <el-form-item label="头颈苔藓样变" prop="headNeckLichenification">
          <el-input v-model="form.headNeckLichenification" placeholder="请输入头颈苔藓样变" />
        </el-form-item>
        <el-form-item label="头颈干燥" prop="headNeckDryness">
          <el-input v-model="form.headNeckDryness" placeholder="请输入头颈干燥" />
        </el-form-item>
        <el-form-item label="头颈其他" prop="headNeckOther">
          <el-input v-model="form.headNeckOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="上肢红斑" prop="upperLimbErythema">
          <el-input v-model="form.upperLimbErythema" placeholder="请输入上肢红斑" />
        </el-form-item>
        <el-form-item label="上肢丘疹" prop="upperLimbPapule">
          <el-input v-model="form.upperLimbPapule" placeholder="请输入上肢丘疹" />
        </el-form-item>
        <el-form-item label="上肢渗出" prop="upperLimbExudation">
          <el-input v-model="form.upperLimbExudation" placeholder="请输入上肢渗出" />
        </el-form-item>
        <el-form-item label="上肢表皮剥脱" prop="upperLimbDesquamation">
          <el-input v-model="form.upperLimbDesquamation" placeholder="请输入上肢表皮剥脱" />
        </el-form-item>
        <el-form-item label="上肢苔藓样变" prop="upperLimbLichenification">
          <el-input v-model="form.upperLimbLichenification" placeholder="请输入上肢苔藓样变" />
        </el-form-item>
        <el-form-item label="上肢干燥" prop="upperLimbDryness">
          <el-input v-model="form.upperLimbDryness" placeholder="请输入上肢干燥" />
        </el-form-item>
        <el-form-item label="上肢其他" prop="upperLimbOther">
          <el-input v-model="form.upperLimbOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="躯干红斑" prop="trunkErythema">
          <el-input v-model="form.trunkErythema" placeholder="请输入躯干红斑" />
        </el-form-item>
        <el-form-item label="躯干丘疹" prop="trunkPapule">
          <el-input v-model="form.trunkPapule" placeholder="请输入躯干丘疹" />
        </el-form-item>
        <el-form-item label="躯干渗出" prop="trunkExudation">
          <el-input v-model="form.trunkExudation" placeholder="请输入躯干渗出" />
        </el-form-item>
        <el-form-item label="躯干表皮剥脱" prop="trunkDesquamation">
          <el-input v-model="form.trunkDesquamation" placeholder="请输入躯干表皮剥脱" />
        </el-form-item>
        <el-form-item label="躯干苔藓样变" prop="trunkLichenification">
          <el-input v-model="form.trunkLichenification" placeholder="请输入躯干苔藓样变" />
        </el-form-item>
        <el-form-item label="躯干干燥" prop="trunkDryness">
          <el-input v-model="form.trunkDryness" placeholder="请输入躯干干燥" />
        </el-form-item>
        <el-form-item label="躯干其他" prop="trunkOther">
          <el-input v-model="form.trunkOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="下肢红斑" prop="lowerLimbErythema">
          <el-input v-model="form.lowerLimbErythema" placeholder="请输入下肢红斑" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbPapule">
          <el-input v-model="form.lowerLimbPapule" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbExudation">
          <el-input v-model="form.lowerLimbExudation" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbDesquamation">
          <el-input v-model="form.lowerLimbDesquamation" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbLichenification">
          <el-input v-model="form.lowerLimbLichenification" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbDryness">
          <el-input v-model="form.lowerLimbDryness" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lowerLimbOther">
          <el-input v-model="form.lowerLimbOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="生殖器红斑" prop="genitalErythema">
          <el-input v-model="form.genitalErythema" placeholder="请输入生殖器红斑" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalPapule">
          <el-input v-model="form.genitalPapule" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalExudation">
          <el-input v-model="form.genitalExudation" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalDesquamation">
          <el-input v-model="form.genitalDesquamation" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalLichenification">
          <el-input v-model="form.genitalLichenification" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalDryness">
          <el-input v-model="form.genitalDryness" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="genitalOther">
          <el-input v-model="form.genitalOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="电子呼吸音" prop="electronicBreathSoundPath">
          <el-input v-model="form.electronicBreathSoundPath" type="textarea" placeholder="请输入内容" />
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
import { listExam, getExam, delExam, addExam, updateExam } from "@/api/FollowSys/exam"

export default {
  name: "Exam",
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
      // 体征表格数据
      examList: [],
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
    /** 查询体征列表 */
    getList() {
      this.loading = true
      listExam(this.queryParams).then(response => {
        this.examList = response.rows
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
        examId: null,
        followupId: null,
        temperatureC: null,
        pulseBpm: null,
        spo2Percent: null,
        oxygenUsed: null,
        consciousness: null,
        mentalState: null,
        breathingPattern: null,
        appearance: null,
        nasalMucosaPale: null,
        nasalMucosaEdema: null,
        nasalMucosaSwelling: null,
        nasalMucosaClearDischarge: null,
        nasalScore: null,
        threeDepressionSign: null,
        leftLungSound: null,
        leftDryRalesPresent: null,
        leftDryRalesDistribution: null,
        leftWetRalesPresent: null,
        leftWetRalesDistribution: null,
        rightLungSound: null,
        rightDryRalesPresent: null,
        rightDryRalesDistribution: null,
        rightWetRalesPresent: null,
        rightWetRalesDistribution: null,
        heartRate: null,
        heartRhythm: null,
        heartMurmurPresent: null,
        heartMurmurType: null,
        abdomenShape: null,
        abdomenTenderness: null,
        reboundTenderness: null,
        headNeckErythema: null,
        headNeckPapule: null,
        headNeckExudation: null,
        headNeckDesquamation: null,
        headNeckLichenification: null,
        headNeckDryness: null,
        headNeckOther: null,
        upperLimbErythema: null,
        upperLimbPapule: null,
        upperLimbExudation: null,
        upperLimbDesquamation: null,
        upperLimbLichenification: null,
        upperLimbDryness: null,
        upperLimbOther: null,
        trunkErythema: null,
        trunkPapule: null,
        trunkExudation: null,
        trunkDesquamation: null,
        trunkLichenification: null,
        trunkDryness: null,
        trunkOther: null,
        lowerLimbErythema: null,
        lowerLimbPapule: null,
        lowerLimbExudation: null,
        lowerLimbDesquamation: null,
        lowerLimbLichenification: null,
        lowerLimbDryness: null,
        lowerLimbOther: null,
        genitalErythema: null,
        genitalPapule: null,
        genitalExudation: null,
        genitalDesquamation: null,
        genitalLichenification: null,
        genitalDryness: null,
        genitalOther: null,
        electronicBreathSoundPath: null
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
      this.ids = selection.map(item => item.examId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加体征"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const examId = row.examId || this.ids
      getExam(examId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改体征"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.examId != null) {
            updateExam(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addExam(this.form).then(response => {
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
      const examIds = row.examId || this.ids
      this.$modal.confirm('是否确认删除体征编号为"' + examIds + '"的数据项？').then(function() {
        return delExam(examIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/exam/export', {
        ...this.queryParams
      }, `exam_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
