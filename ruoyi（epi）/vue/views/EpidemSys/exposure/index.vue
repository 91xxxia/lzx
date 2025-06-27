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
          v-hasPermi="['EpidemSys:exposure:add']"
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
          v-hasPermi="['EpidemSys:exposure:edit']"
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
          v-hasPermi="['EpidemSys:exposure:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:exposure:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="exposureList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="家庭环境号" align="center" prop="envId" />
      <el-table-column label="患者号" align="center" prop="surveyId" />
      <el-table-column label="房屋类型" align="center" prop="houseType" />
      <el-table-column label="建筑材料" align="center" prop="buildingMaterial" />
      <el-table-column label="通风频率" align="center" prop="ventilationFreq" />
      <el-table-column label="空调使用季节" align="center" prop="acUsageSeason" />
      <el-table-column label="空调使用频率" align="center" prop="acUsageFreq" />
      <el-table-column label="空调温度设定" align="center" prop="acTempSetting" />
      <el-table-column label="空调模式" align="center" prop="acModes" />
      <el-table-column label="空调滤网清洁频率" align="center" prop="acFilterCleaningFreq" />
      <el-table-column label="暖气类型" align="center" prop="heatingType" />
      <el-table-column label="室温范围" align="center" prop="heatingTempRange" />
      <el-table-column label="有无地毯" align="center" prop="hasCarpet" />
      <el-table-column label="有无毛绒玩具" align="center" prop="hasSoftToys" />
      <el-table-column label="pm2.5家庭年均浓度" align="center" prop="pm25Avg" />
      <el-table-column label="花粉信息" align="center" prop="pollenInfo" />
      <el-table-column label="甲醛浓度" align="center" prop="formaldehydeLevel" />
      <el-table-column label="甲醛检测时间" align="center" prop="formaldehydeTestTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.formaldehydeTestTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="尘螨浓度" align="center" prop="dustMiteLevel" />
      <el-table-column label="其他过敏源" align="center" prop="otherAllergens" />
      <el-table-column label="运动频率" align="center" prop="exerciseFrequency" />
      <el-table-column label="运动时间" align="center" prop="exerciseDuration" />
      <el-table-column label="运动强度" align="center" prop="exerciseIntensity" />
      <el-table-column label="有无游泳" align="center" prop="swimming" />
      <el-table-column label="睡眠时长" align="center" prop="sleepHours" />
      <el-table-column label="有无失眠" align="center" prop="insomnia" />
      <el-table-column label="昼夜节律紊乱" align="center" prop="circadianDisruption" />
      <el-table-column label="吸烟暴露类型" align="center" prop="smokeExposureType" />
      <el-table-column label="清洁频率" align="center" prop="cleaningFreq" />
      <el-table-column label="有无宠物" align="center" prop="hasPets" />
      <el-table-column label="宠物类型" align="center" prop="petTypes" />
      <el-table-column label="宠物数量" align="center" prop="petCount" />
      <el-table-column label="吸烟者同居情况" align="center" prop="livesWithSmoker" />
      <el-table-column label="烹饪燃料" align="center" prop="cookingFuel" />
      <el-table-column label="空气净化器使用" align="center" prop="usesAirPurifier" />
      <el-table-column label="吸尘器使用" align="center" prop="usesVacuumCleaner" />
      <el-table-column label="过敏源回避措施执行情况" align="center" prop="avoidanceQuality" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:exposure:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:exposure:remove']"
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

    <!-- 添加或修改家庭环境暴露信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者号" prop="surveyId">
          <el-input v-model="form.surveyId" placeholder="请输入患者号" />
        </el-form-item>
        <el-form-item label="空调模式" prop="acModes">
          <el-input v-model="form.acModes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="有无地毯" prop="hasCarpet">
          <el-input v-model="form.hasCarpet" placeholder="请输入有无地毯" />
        </el-form-item>
        <el-form-item label="有无毛绒玩具" prop="hasSoftToys">
          <el-input v-model="form.hasSoftToys" placeholder="请输入有无毛绒玩具" />
        </el-form-item>
        <el-form-item label="pm2.5家庭年均浓度" prop="pm25Avg">
          <el-input v-model="form.pm25Avg" placeholder="请输入pm2.5家庭年均浓度" />
        </el-form-item>
        <el-form-item label="花粉信息" prop="pollenInfo">
          <el-input v-model="form.pollenInfo" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="甲醛浓度" prop="formaldehydeLevel">
          <el-input v-model="form.formaldehydeLevel" placeholder="请输入甲醛浓度" />
        </el-form-item>
        <el-form-item label="甲醛检测时间" prop="formaldehydeTestTime">
          <el-date-picker clearable
            v-model="form.formaldehydeTestTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择甲醛检测时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="尘螨浓度" prop="dustMiteLevel">
          <el-input v-model="form.dustMiteLevel" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="其他过敏源" prop="otherAllergens">
          <el-input v-model="form.otherAllergens" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="运动频率" prop="exerciseFrequency">
          <el-input v-model="form.exerciseFrequency" placeholder="请输入运动频率" />
        </el-form-item>
        <el-form-item label="运动时间" prop="exerciseDuration">
          <el-input v-model="form.exerciseDuration" placeholder="请输入运动时间" />
        </el-form-item>
        <el-form-item label="有无游泳" prop="swimming">
          <el-input v-model="form.swimming" placeholder="请输入有无游泳" />
        </el-form-item>
        <el-form-item label="睡眠时长" prop="sleepHours">
          <el-input v-model="form.sleepHours" placeholder="请输入睡眠时长" />
        </el-form-item>
        <el-form-item label="有无失眠" prop="insomnia">
          <el-input v-model="form.insomnia" placeholder="请输入有无失眠" />
        </el-form-item>
        <el-form-item label="昼夜节律紊乱" prop="circadianDisruption">
          <el-input v-model="form.circadianDisruption" placeholder="请输入昼夜节律紊乱" />
        </el-form-item>
        <el-form-item label="有无宠物" prop="hasPets">
          <el-input v-model="form.hasPets" placeholder="请输入有无宠物" />
        </el-form-item>
        <el-form-item label="宠物类型" prop="petTypes">
          <el-input v-model="form.petTypes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="宠物数量" prop="petCount">
          <el-input v-model="form.petCount" placeholder="请输入宠物数量" />
        </el-form-item>
        <el-form-item label="吸烟者同居情况" prop="livesWithSmoker">
          <el-input v-model="form.livesWithSmoker" placeholder="请输入吸烟者同居情况" />
        </el-form-item>
        <el-form-item label="空气净化器使用" prop="usesAirPurifier">
          <el-input v-model="form.usesAirPurifier" placeholder="请输入空气净化器使用" />
        </el-form-item>
        <el-form-item label="吸尘器使用" prop="usesVacuumCleaner">
          <el-input v-model="form.usesVacuumCleaner" placeholder="请输入吸尘器使用" />
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
import { listExposure, getExposure, delExposure, addExposure, updateExposure } from "@/api/EpidemSys/exposure"

export default {
  name: "Exposure",
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
      // 家庭环境暴露信息表格数据
      exposureList: [],
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
    /** 查询家庭环境暴露信息列表 */
    getList() {
      this.loading = true
      listExposure(this.queryParams).then(response => {
        this.exposureList = response.rows
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
        envId: null,
        surveyId: null,
        houseType: null,
        buildingMaterial: null,
        ventilationFreq: null,
        acUsageSeason: null,
        acUsageFreq: null,
        acTempSetting: null,
        acModes: null,
        acFilterCleaningFreq: null,
        heatingType: null,
        heatingTempRange: null,
        hasCarpet: null,
        hasSoftToys: null,
        pm25Avg: null,
        pollenInfo: null,
        formaldehydeLevel: null,
        formaldehydeTestTime: null,
        dustMiteLevel: null,
        otherAllergens: null,
        exerciseFrequency: null,
        exerciseDuration: null,
        exerciseIntensity: null,
        swimming: null,
        sleepHours: null,
        insomnia: null,
        circadianDisruption: null,
        smokeExposureType: null,
        cleaningFreq: null,
        hasPets: null,
        petTypes: null,
        petCount: null,
        livesWithSmoker: null,
        cookingFuel: null,
        usesAirPurifier: null,
        usesVacuumCleaner: null,
        avoidanceQuality: null
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
      this.ids = selection.map(item => item.envId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加家庭环境暴露信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const envId = row.envId || this.ids
      getExposure(envId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改家庭环境暴露信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.envId != null) {
            updateExposure(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addExposure(this.form).then(response => {
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
      const envIds = row.envId || this.ids
      this.$modal.confirm('是否确认删除家庭环境暴露信息编号为"' + envIds + '"的数据项？').then(function() {
        return delExposure(envIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/exposure/export', {
        ...this.queryParams
      }, `exposure_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
