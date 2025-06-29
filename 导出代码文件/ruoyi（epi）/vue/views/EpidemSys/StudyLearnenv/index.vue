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
          v-hasPermi="['EpidemSys:StudyLearnenv:add']"
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
          v-hasPermi="['EpidemSys:StudyLearnenv:edit']"
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
          v-hasPermi="['EpidemSys:StudyLearnenv:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:StudyLearnenv:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="StudyLearnenvList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学习/工作环境号" align="center" prop="learnEnvId" />
      <el-table-column label="患者号" align="center" prop="surveyId" />
      <el-table-column label="单位位置" align="center" prop="locationType" />
      <el-table-column label="通风情况" align="center" prop="ventilationQuality" />
      <el-table-column label="PM2.5年均值" align="center" prop="pm25Annual" />
      <el-table-column label="花粉季节性峰值浓度" align="center" prop="pollenPeakConcentration" />
      <el-table-column label="花粉类型" align="center" prop="pollenTypes" />
      <el-table-column label="甲醛检测值" align="center" prop="formaldehydeLevelWorkplace" />
      <el-table-column label="有无地毯" align="center" prop="hasCarpet" />
      <el-table-column label="有无布艺家具" align="center" prop="hasFabricFurniture" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:StudyLearnenv:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:StudyLearnenv:remove']"
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

    <!-- 添加或修改学习/工作环境信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者号" prop="surveyId">
          <el-input v-model="form.surveyId" placeholder="请输入患者号" />
        </el-form-item>
        <el-form-item label="单位位置" prop="locationType">
          <el-input v-model="form.locationType" placeholder="请输入单位位置" />
        </el-form-item>
        <el-form-item label="通风情况" prop="ventilationQuality">
          <el-input v-model="form.ventilationQuality" placeholder="请输入通风情况" />
        </el-form-item>
        <el-form-item label="PM2.5年均值" prop="pm25Annual">
          <el-input v-model="form.pm25Annual" placeholder="请输入PM2.5年均值" />
        </el-form-item>
        <el-form-item label="花粉季节性峰值浓度" prop="pollenPeakConcentration">
          <el-input v-model="form.pollenPeakConcentration" placeholder="请输入花粉季节性峰值浓度" />
        </el-form-item>
        <el-form-item label="花粉类型" prop="pollenTypes">
          <el-input v-model="form.pollenTypes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="甲醛检测值" prop="formaldehydeLevelWorkplace">
          <el-input v-model="form.formaldehydeLevelWorkplace" placeholder="请输入甲醛检测值" />
        </el-form-item>
        <el-form-item label="有无地毯" prop="hasCarpet">
          <el-input v-model="form.hasCarpet" placeholder="请输入有无地毯" />
        </el-form-item>
        <el-form-item label="有无布艺家具" prop="hasFabricFurniture">
          <el-input v-model="form.hasFabricFurniture" placeholder="请输入有无布艺家具" />
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
import { listStudyLearnenv, getStudyLearnenv, delStudyLearnenv, addStudyLearnenv, updateStudyLearnenv } from "@/api/EpidemSys/StudyLearnenv"

export default {
  name: "StudyLearnenv",
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
      // 学习/工作环境信息表格数据
      StudyLearnenvList: [],
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
    /** 查询学习/工作环境信息列表 */
    getList() {
      this.loading = true
      listStudyLearnenv(this.queryParams).then(response => {
        this.StudyLearnenvList = response.rows
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
        learnEnvId: null,
        surveyId: null,
        locationType: null,
        ventilationQuality: null,
        pm25Annual: null,
        pollenPeakConcentration: null,
        pollenTypes: null,
        formaldehydeLevelWorkplace: null,
        hasCarpet: null,
        hasFabricFurniture: null
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
      this.ids = selection.map(item => item.learnEnvId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加学习/工作环境信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const learnEnvId = row.learnEnvId || this.ids
      getStudyLearnenv(learnEnvId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改学习/工作环境信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.learnEnvId != null) {
            updateStudyLearnenv(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addStudyLearnenv(this.form).then(response => {
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
      const learnEnvIds = row.learnEnvId || this.ids
      this.$modal.confirm('是否确认删除学习/工作环境信息编号为"' + learnEnvIds + '"的数据项？').then(function() {
        return delStudyLearnenv(learnEnvIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/StudyLearnenv/export', {
        ...this.queryParams
      }, `StudyLearnenv_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
