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
          v-hasPermi="['FollowSys:reactions:add']"
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
          v-hasPermi="['FollowSys:reactions:edit']"
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
          v-hasPermi="['FollowSys:reactions:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:reactions:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="reactionsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="不良反应号" align="center" prop="reactionId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="药品名称" align="center" prop="medicationName" />
      <el-table-column label="不良反应发生时间" align="center" prop="reactionOnsetDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.reactionOnsetDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="药物用量用法" align="center" prop="usageMethod" />
      <el-table-column label="复用天数" align="center" prop="durationDays" />
      <el-table-column label="皮瘆" align="center" prop="rash" />
      <el-table-column label="瘙痒" align="center" prop="itching" />
      <el-table-column label="腹痛" align="center" prop="abdominalPain" />
      <el-table-column label="恶心" align="center" prop="nausea" />
      <el-table-column label="呕吐" align="center" prop="vomiting" />
      <el-table-column label="胸闷" align="center" prop="chestTightness" />
      <el-table-column label="心悸" align="center" prop="palpitations" />
      <el-table-column label="呼吸困难" align="center" prop="dyspnea" />
      <el-table-column label="其他" align="center" prop="otherReaction" />
      <el-table-column label="严重程度" align="center" prop="severityLevel" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:reactions:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:reactions:remove']"
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

    <!-- 添加或修改药物不良反应对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="药品名称" prop="medicationName">
          <el-input v-model="form.medicationName" placeholder="请输入药品名称" />
        </el-form-item>
        <el-form-item label="不良反应发生时间" prop="reactionOnsetDate">
          <el-date-picker clearable
            v-model="form.reactionOnsetDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择不良反应发生时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="药物用量用法" prop="usageMethod">
          <el-input v-model="form.usageMethod" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="复用天数" prop="durationDays">
          <el-input v-model="form.durationDays" placeholder="请输入复用天数" />
        </el-form-item>
        <el-form-item label="皮瘆" prop="rash">
          <el-input v-model="form.rash" placeholder="请输入皮瘆" />
        </el-form-item>
        <el-form-item label="瘙痒" prop="itching">
          <el-input v-model="form.itching" placeholder="请输入瘙痒" />
        </el-form-item>
        <el-form-item label="腹痛" prop="abdominalPain">
          <el-input v-model="form.abdominalPain" placeholder="请输入腹痛" />
        </el-form-item>
        <el-form-item label="恶心" prop="nausea">
          <el-input v-model="form.nausea" placeholder="请输入恶心" />
        </el-form-item>
        <el-form-item label="呕吐" prop="vomiting">
          <el-input v-model="form.vomiting" placeholder="请输入呕吐" />
        </el-form-item>
        <el-form-item label="胸闷" prop="chestTightness">
          <el-input v-model="form.chestTightness" placeholder="请输入胸闷" />
        </el-form-item>
        <el-form-item label="心悸" prop="palpitations">
          <el-input v-model="form.palpitations" placeholder="请输入心悸" />
        </el-form-item>
        <el-form-item label="呼吸困难" prop="dyspnea">
          <el-input v-model="form.dyspnea" placeholder="请输入呼吸困难" />
        </el-form-item>
        <el-form-item label="其他" prop="otherReaction">
          <el-input v-model="form.otherReaction" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="严重程度" prop="severityLevel">
          <el-input v-model="form.severityLevel" placeholder="请输入严重程度" />
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
import { listReactions, getReactions, delReactions, addReactions, updateReactions } from "@/api/FollowSys/reactions"

export default {
  name: "Reactions",
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
      // 药物不良反应表格数据
      reactionsList: [],
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
    /** 查询药物不良反应列表 */
    getList() {
      this.loading = true
      listReactions(this.queryParams).then(response => {
        this.reactionsList = response.rows
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
        reactionId: null,
        patientId: null,
        medicationName: null,
        reactionOnsetDate: null,
        usageMethod: null,
        durationDays: null,
        rash: null,
        itching: null,
        abdominalPain: null,
        nausea: null,
        vomiting: null,
        chestTightness: null,
        palpitations: null,
        dyspnea: null,
        otherReaction: null,
        severityLevel: null
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
      this.ids = selection.map(item => item.reactionId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加药物不良反应"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const reactionId = row.reactionId || this.ids
      getReactions(reactionId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改药物不良反应"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.reactionId != null) {
            updateReactions(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addReactions(this.form).then(response => {
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
      const reactionIds = row.reactionId || this.ids
      this.$modal.confirm('是否确认删除药物不良反应编号为"' + reactionIds + '"的数据项？').then(function() {
        return delReactions(reactionIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/reactions/export', {
        ...this.queryParams
      }, `reactions_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
