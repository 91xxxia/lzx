<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="病人号" prop="patientId">
        <el-input
          v-model="queryParams.patientId"
          placeholder="请输入病人号"
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
          v-hasPermi="['FollowSys:scores:add']"
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
          v-hasPermi="['FollowSys:scores:edit']"
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
          v-hasPermi="['FollowSys:scores:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:scores:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="scoresList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="问卷号" align="center" prop="questionnaireId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="评分时间" align="center" prop="scoreDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.scoreDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="ACT" align="center" prop="actScore" />
      <el-table-column label="C-ACT" align="center" prop="cActScore" />
      <el-table-column label="TRACK" align="center" prop="trackScore" />
      <el-table-column label="症状药物评分" align="center" prop="symptomMedicationScore" />
      <el-table-column label="儿童皮肤病治疗指数" align="center" prop="cdlqiScore" />
      <el-table-column label="儿童皮炎评分" align="center" prop="scoardScore" />
      <el-table-column label="婴儿皮肤病生活指数" align="center" prop="idqolScore" />
      <el-table-column label="鼻炎VSA评分" align="center" prop="rhinitisVasScore" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:scores:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:scores:remove']"
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

    <!-- 添加或修改调查问卷对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="评分时间" prop="scoreDate">
          <el-date-picker clearable
            v-model="form.scoreDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择评分时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="ACT" prop="actScore">
          <el-input v-model="form.actScore" placeholder="请输入ACT" />
        </el-form-item>
        <el-form-item label="C-ACT" prop="cActScore">
          <el-input v-model="form.cActScore" placeholder="请输入C-ACT" />
        </el-form-item>
        <el-form-item label="TRACK" prop="trackScore">
          <el-input v-model="form.trackScore" placeholder="请输入TRACK" />
        </el-form-item>
        <el-form-item label="症状药物评分" prop="symptomMedicationScore">
          <el-input v-model="form.symptomMedicationScore" placeholder="请输入症状药物评分" />
        </el-form-item>
        <el-form-item label="儿童皮肤病治疗指数" prop="cdlqiScore">
          <el-input v-model="form.cdlqiScore" placeholder="请输入儿童皮肤病治疗指数" />
        </el-form-item>
        <el-form-item label="儿童皮炎评分" prop="scoardScore">
          <el-input v-model="form.scoardScore" placeholder="请输入儿童皮炎评分" />
        </el-form-item>
        <el-form-item label="婴儿皮肤病生活指数" prop="idqolScore">
          <el-input v-model="form.idqolScore" placeholder="请输入婴儿皮肤病生活指数" />
        </el-form-item>
        <el-form-item label="鼻炎VSA评分" prop="rhinitisVasScore">
          <el-input v-model="form.rhinitisVasScore" placeholder="请输入鼻炎VSA评分" />
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
import { listScores, getScores, delScores, addScores, updateScores } from "@/api/FollowSys/scores"

export default {
  name: "Scores",
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
      // 调查问卷表格数据
      scoresList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        patientId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        patientId: [
          { required: true, message: "病人号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询调查问卷列表 */
    getList() {
      this.loading = true
      listScores(this.queryParams).then(response => {
        this.scoresList = response.rows
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
        questionnaireId: null,
        patientId: null,
        scoreDate: null,
        actScore: null,
        cActScore: null,
        trackScore: null,
        symptomMedicationScore: null,
        cdlqiScore: null,
        scoardScore: null,
        idqolScore: null,
        rhinitisVasScore: null
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
      this.ids = selection.map(item => item.questionnaireId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加调查问卷"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const questionnaireId = row.questionnaireId || this.ids
      getScores(questionnaireId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改调查问卷"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.questionnaireId != null) {
            updateScores(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addScores(this.form).then(response => {
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
      const questionnaireIds = row.questionnaireId || this.ids
      this.$modal.confirm('是否确认删除调查问卷编号为"' + questionnaireIds + '"的数据项？').then(function() {
        return delScores(questionnaireIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/scores/export', {
        ...this.queryParams
      }, `scores_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
