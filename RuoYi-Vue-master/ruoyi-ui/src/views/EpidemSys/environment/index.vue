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
          v-hasPermi="['EpidemSys:environment:add']"
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
          v-hasPermi="['EpidemSys:environment:edit']"
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
          v-hasPermi="['EpidemSys:environment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:environment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="environmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="城乡环境号" align="center" prop="envAreaId" />
      <el-table-column label="患者号" align="center" prop="surveyId" />
      <el-table-column label="城市pm2.5年均浓度" align="center" prop="urbanPm25Avg" />
      <el-table-column label="城市pm2.5季节性变化" align="center" prop="urbanPm25Seasonal" />
      <el-table-column label="城市花粉类型" align="center" prop="urbanPollenTypes" />
      <el-table-column label="城市花粉月度分布" align="center" prop="urbanPollenDistribution" />
      <el-table-column label="城市花粉峰值浓度" align="center" prop="urbanPollenPeak" />
      <el-table-column label="城市其他污染物" align="center" prop="urbanPollutants" />
      <el-table-column label="城市监测点位置" align="center" prop="urbanMonitorLocation" />
      <el-table-column label="乡村焚烧期pm2.5浓度" align="center" prop="ruralPm25Burning" />
      <el-table-column label="乡村pm2.5年均值" align="center" prop="ruralPm25Avg" />
      <el-table-column label="乡村花粉类型" align="center" prop="ruralPollenTypes" />
      <el-table-column label="乡村生物质燃料污染" align="center" prop="ruralBiomassPollution" />
      <el-table-column label="乡村饮用水源类型" align="center" prop="ruralWaterSource" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:environment:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:environment:remove']"
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

    <!-- 添加或修改城乡环境监测对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者号" prop="surveyId">
          <el-input v-model="form.surveyId" placeholder="请输入患者号" />
        </el-form-item>
        <el-form-item label="城市pm2.5年均浓度" prop="urbanPm25Avg">
          <el-input v-model="form.urbanPm25Avg" placeholder="请输入城市pm2.5年均浓度" />
        </el-form-item>
        <el-form-item label="城市pm2.5季节性变化" prop="urbanPm25Seasonal">
          <el-input v-model="form.urbanPm25Seasonal" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="城市花粉类型" prop="urbanPollenTypes">
          <el-input v-model="form.urbanPollenTypes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="城市花粉月度分布" prop="urbanPollenDistribution">
          <el-input v-model="form.urbanPollenDistribution" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="城市花粉峰值浓度" prop="urbanPollenPeak">
          <el-input v-model="form.urbanPollenPeak" placeholder="请输入城市花粉峰值浓度" />
        </el-form-item>
        <el-form-item label="城市其他污染物" prop="urbanPollutants">
          <el-input v-model="form.urbanPollutants" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="乡村焚烧期pm2.5浓度" prop="ruralPm25Burning">
          <el-input v-model="form.ruralPm25Burning" placeholder="请输入乡村焚烧期pm2.5浓度" />
        </el-form-item>
        <el-form-item label="乡村pm2.5年均值" prop="ruralPm25Avg">
          <el-input v-model="form.ruralPm25Avg" placeholder="请输入乡村pm2.5年均值" />
        </el-form-item>
        <el-form-item label="乡村花粉类型" prop="ruralPollenTypes">
          <el-input v-model="form.ruralPollenTypes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="乡村生物质燃料污染" prop="ruralBiomassPollution">
          <el-input v-model="form.ruralBiomassPollution" placeholder="请输入乡村生物质燃料污染" />
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
import { listEnvironment, getEnvironment, delEnvironment, addEnvironment, updateEnvironment } from "@/api/EpidemSys/environment"

export default {
  name: "Environment",
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
      // 城乡环境监测表格数据
      environmentList: [],
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
    /** 查询城乡环境监测列表 */
    getList() {
      this.loading = true
      listEnvironment(this.queryParams).then(response => {
        this.environmentList = response.rows
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
        envAreaId: null,
        surveyId: null,
        urbanPm25Avg: null,
        urbanPm25Seasonal: null,
        urbanPollenTypes: null,
        urbanPollenDistribution: null,
        urbanPollenPeak: null,
        urbanPollutants: null,
        urbanMonitorLocation: null,
        ruralPm25Burning: null,
        ruralPm25Avg: null,
        ruralPollenTypes: null,
        ruralBiomassPollution: null,
        ruralWaterSource: null
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
      this.ids = selection.map(item => item.envAreaId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加城乡环境监测"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const envAreaId = row.envAreaId || this.ids
      getEnvironment(envAreaId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改城乡环境监测"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.envAreaId != null) {
            updateEnvironment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addEnvironment(this.form).then(response => {
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
      const envAreaIds = row.envAreaId || this.ids
      this.$modal.confirm('是否确认删除城乡环境监测编号为"' + envAreaIds + '"的数据项？').then(function() {
        return delEnvironment(envAreaIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/environment/export', {
        ...this.queryParams
      }, `environment_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
