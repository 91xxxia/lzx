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
          v-hasPermi="['FollowSys:symptoms:add']"
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
          v-hasPermi="['FollowSys:symptoms:edit']"
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
          v-hasPermi="['FollowSys:symptoms:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:symptoms:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="symptomsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="症状号" align="center" prop="symptomId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="鼻痒" align="center" prop="itchyNose" />
      <el-table-column label="喷嚏" align="center" prop="sneezing" />
      <el-table-column label="流清涕" align="center" prop="clearDischarge" />
      <el-table-column label="鼻塞" align="center" prop="nasalCongestion" />
      <el-table-column label="眼痒" align="center" prop="itchyEyes" />
      <el-table-column label="流泪" align="center" prop="tearing" />
      <el-table-column label="眼红" align="center" prop="redEyes" />
      <el-table-column label="眼灼热感" align="center" prop="eyeBurning" />
      <el-table-column label="咽痒" align="center" prop="itchyThroat" />
      <el-table-column label="发热" align="center" prop="fever" />
      <el-table-column label="张口呼吸" align="center" prop="mouthBreathing" />
      <el-table-column label="打鼾" align="center" prop="snoring" />
      <el-table-column label="咳嗽" align="center" prop="cough" />
      <el-table-column label="喘息" align="center" prop="wheezing" />
      <el-table-column label="气促" align="center" prop="dyspnea" />
      <el-table-column label="胸闷" align="center" prop="chestTightness" />
      <el-table-column label="长叹气" align="center" prop="sighing" />
      <el-table-column label="活动受限" align="center" prop="activityLimitation" />
      <el-table-column label="夜间憋醒" align="center" prop="nighttimeAwake" />
      <el-table-column label="夜间及晨起症状加重" align="center" prop="morningNightWorse" />
      <el-table-column label="皮瘆" align="center" prop="rash" />
      <el-table-column label="瘙痒" align="center" prop="itching" />
      <el-table-column label="疼痛" align="center" prop="pain" />
      <el-table-column label="睡眠障碍" align="center" prop="sleepDisorder" />
      <el-table-column label="严重程度" align="center" prop="severity" />
      <el-table-column label="症状频率" align="center" prop="frequencyPattern" />
      <el-table-column label="症状开始时间" align="center" prop="startDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="诱因抽烟" align="center" prop="triggerSmoke" />
      <el-table-column label="诱因尘螨" align="center" prop="triggerDustMite" />
      <el-table-column label="诱因花粉" align="center" prop="triggerPollen" />
      <el-table-column label="诱因病毒感染" align="center" prop="triggerVirus" />
      <el-table-column label="诱因霉菌" align="center" prop="triggerMold" />
      <el-table-column label="诱因冷空气" align="center" prop="triggerColdAir" />
      <el-table-column label="诱因气候改变" align="center" prop="triggerWeatherChange" />
      <el-table-column label="诱因运动" align="center" prop="triggerExercise" />
      <el-table-column label="诱因哭闹" align="center" prop="triggerCrying" />
      <el-table-column label="诱因食物" align="center" prop="triggerFood" />
      <el-table-column label="诱因药物" align="center" prop="triggerMedication" />
      <el-table-column label="诱因其他" align="center" prop="triggerOther" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:symptoms:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:symptoms:remove']"
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

    <!-- 添加或修改症状对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="鼻痒" prop="itchyNose">
          <el-input v-model="form.itchyNose" placeholder="请输入鼻痒" />
        </el-form-item>
        <el-form-item label="喷嚏" prop="sneezing">
          <el-input v-model="form.sneezing" placeholder="请输入喷嚏" />
        </el-form-item>
        <el-form-item label="流清涕" prop="clearDischarge">
          <el-input v-model="form.clearDischarge" placeholder="请输入流清涕" />
        </el-form-item>
        <el-form-item label="鼻塞" prop="nasalCongestion">
          <el-input v-model="form.nasalCongestion" placeholder="请输入鼻塞" />
        </el-form-item>
        <el-form-item label="眼痒" prop="itchyEyes">
          <el-input v-model="form.itchyEyes" placeholder="请输入眼痒" />
        </el-form-item>
        <el-form-item label="流泪" prop="tearing">
          <el-input v-model="form.tearing" placeholder="请输入流泪" />
        </el-form-item>
        <el-form-item label="眼红" prop="redEyes">
          <el-input v-model="form.redEyes" placeholder="请输入眼红" />
        </el-form-item>
        <el-form-item label="眼灼热感" prop="eyeBurning">
          <el-input v-model="form.eyeBurning" placeholder="请输入眼灼热感" />
        </el-form-item>
        <el-form-item label="咽痒" prop="itchyThroat">
          <el-input v-model="form.itchyThroat" placeholder="请输入咽痒" />
        </el-form-item>
        <el-form-item label="发热" prop="fever">
          <el-input v-model="form.fever" placeholder="请输入发热" />
        </el-form-item>
        <el-form-item label="张口呼吸" prop="mouthBreathing">
          <el-input v-model="form.mouthBreathing" placeholder="请输入张口呼吸" />
        </el-form-item>
        <el-form-item label="打鼾" prop="snoring">
          <el-input v-model="form.snoring" placeholder="请输入打鼾" />
        </el-form-item>
        <el-form-item label="咳嗽" prop="cough">
          <el-input v-model="form.cough" placeholder="请输入咳嗽" />
        </el-form-item>
        <el-form-item label="喘息" prop="wheezing">
          <el-input v-model="form.wheezing" placeholder="请输入喘息" />
        </el-form-item>
        <el-form-item label="气促" prop="dyspnea">
          <el-input v-model="form.dyspnea" placeholder="请输入气促" />
        </el-form-item>
        <el-form-item label="胸闷" prop="chestTightness">
          <el-input v-model="form.chestTightness" placeholder="请输入胸闷" />
        </el-form-item>
        <el-form-item label="长叹气" prop="sighing">
          <el-input v-model="form.sighing" placeholder="请输入长叹气" />
        </el-form-item>
        <el-form-item label="活动受限" prop="activityLimitation">
          <el-input v-model="form.activityLimitation" placeholder="请输入活动受限" />
        </el-form-item>
        <el-form-item label="夜间憋醒" prop="nighttimeAwake">
          <el-input v-model="form.nighttimeAwake" placeholder="请输入夜间憋醒" />
        </el-form-item>
        <el-form-item label="夜间及晨起症状加重" prop="morningNightWorse">
          <el-input v-model="form.morningNightWorse" placeholder="请输入夜间及晨起症状加重" />
        </el-form-item>
        <el-form-item label="皮瘆" prop="rash">
          <el-input v-model="form.rash" placeholder="请输入皮瘆" />
        </el-form-item>
        <el-form-item label="瘙痒" prop="itching">
          <el-input v-model="form.itching" placeholder="请输入瘙痒" />
        </el-form-item>
        <el-form-item label="疼痛" prop="pain">
          <el-input v-model="form.pain" placeholder="请输入疼痛" />
        </el-form-item>
        <el-form-item label="睡眠障碍" prop="sleepDisorder">
          <el-input v-model="form.sleepDisorder" placeholder="请输入睡眠障碍" />
        </el-form-item>
        <el-form-item label="严重程度" prop="severity">
          <el-input v-model="form.severity" placeholder="请输入严重程度" />
        </el-form-item>
        <el-form-item label="症状频率" prop="frequencyPattern">
          <el-input v-model="form.frequencyPattern" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="症状开始时间" prop="startDate">
          <el-date-picker clearable
            v-model="form.startDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择症状开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="诱因抽烟" prop="triggerSmoke">
          <el-input v-model="form.triggerSmoke" placeholder="请输入诱因抽烟" />
        </el-form-item>
        <el-form-item label="诱因尘螨" prop="triggerDustMite">
          <el-input v-model="form.triggerDustMite" placeholder="请输入诱因尘螨" />
        </el-form-item>
        <el-form-item label="诱因花粉" prop="triggerPollen">
          <el-input v-model="form.triggerPollen" placeholder="请输入诱因花粉" />
        </el-form-item>
        <el-form-item label="诱因病毒感染" prop="triggerVirus">
          <el-input v-model="form.triggerVirus" placeholder="请输入诱因病毒感染" />
        </el-form-item>
        <el-form-item label="诱因霉菌" prop="triggerMold">
          <el-input v-model="form.triggerMold" placeholder="请输入诱因霉菌" />
        </el-form-item>
        <el-form-item label="诱因冷空气" prop="triggerColdAir">
          <el-input v-model="form.triggerColdAir" placeholder="请输入诱因冷空气" />
        </el-form-item>
        <el-form-item label="诱因气候改变" prop="triggerWeatherChange">
          <el-input v-model="form.triggerWeatherChange" placeholder="请输入诱因气候改变" />
        </el-form-item>
        <el-form-item label="诱因运动" prop="triggerExercise">
          <el-input v-model="form.triggerExercise" placeholder="请输入诱因运动" />
        </el-form-item>
        <el-form-item label="诱因哭闹" prop="triggerCrying">
          <el-input v-model="form.triggerCrying" placeholder="请输入诱因哭闹" />
        </el-form-item>
        <el-form-item label="诱因食物" prop="triggerFood">
          <el-input v-model="form.triggerFood" placeholder="请输入诱因食物" />
        </el-form-item>
        <el-form-item label="诱因药物" prop="triggerMedication">
          <el-input v-model="form.triggerMedication" placeholder="请输入诱因药物" />
        </el-form-item>
        <el-form-item label="诱因其他" prop="triggerOther">
          <el-input v-model="form.triggerOther" placeholder="请输入诱因其他" />
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
import { listSymptoms, getSymptoms, delSymptoms, addSymptoms, updateSymptoms } from "@/api/FollowSys/symptoms"

export default {
  name: "Symptoms",
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
      // 症状表格数据
      symptomsList: [],
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
    /** 查询症状列表 */
    getList() {
      this.loading = true
      listSymptoms(this.queryParams).then(response => {
        this.symptomsList = response.rows
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
        symptomId: null,
        followupId: null,
        itchyNose: null,
        sneezing: null,
        clearDischarge: null,
        nasalCongestion: null,
        itchyEyes: null,
        tearing: null,
        redEyes: null,
        eyeBurning: null,
        itchyThroat: null,
        fever: null,
        mouthBreathing: null,
        snoring: null,
        cough: null,
        wheezing: null,
        dyspnea: null,
        chestTightness: null,
        sighing: null,
        activityLimitation: null,
        nighttimeAwake: null,
        morningNightWorse: null,
        rash: null,
        itching: null,
        pain: null,
        sleepDisorder: null,
        severity: null,
        frequencyPattern: null,
        startDate: null,
        triggerSmoke: null,
        triggerDustMite: null,
        triggerPollen: null,
        triggerVirus: null,
        triggerMold: null,
        triggerColdAir: null,
        triggerWeatherChange: null,
        triggerExercise: null,
        triggerCrying: null,
        triggerFood: null,
        triggerMedication: null,
        triggerOther: null
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
      this.ids = selection.map(item => item.symptomId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加症状"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const symptomId = row.symptomId || this.ids
      getSymptoms(symptomId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改症状"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.symptomId != null) {
            updateSymptoms(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addSymptoms(this.form).then(response => {
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
      const symptomIds = row.symptomId || this.ids
      this.$modal.confirm('是否确认删除症状编号为"' + symptomIds + '"的数据项？').then(function() {
        return delSymptoms(symptomIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/symptoms/export', {
        ...this.queryParams
      }, `symptoms_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
