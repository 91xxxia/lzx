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
          v-hasPermi="['ClinicalSys:symptoms:add']"
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
          v-hasPermi="['ClinicalSys:symptoms:edit']"
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
          v-hasPermi="['ClinicalSys:symptoms:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ClinicalSys:symptoms:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="symptomsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="症状号" align="center" prop="symptomId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="症状描述" align="center" prop="symptomDescription" />
      <el-table-column label="严重程度" align="center" prop="severityLevel" />
      <el-table-column label="症状频率" align="center" prop="frequency" />
      <el-table-column label="症状开始时间" align="center" prop="onsetTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.onsetTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="诱因" align="center" prop="triggerFactor" />
      <el-table-column label="体征描述" align="center" prop="physicalSigns" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ClinicalSys:symptoms:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ClinicalSys:symptoms:remove']"
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

    <!-- 添加或修改症状及体征对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="症状描述" prop="symptomDescription">
          <el-input v-model="form.symptomDescription" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="严重程度" prop="severityLevel">
          <el-input v-model="form.severityLevel" placeholder="请输入严重程度" />
        </el-form-item>
        <el-form-item label="症状频率" prop="frequency">
          <el-input v-model="form.frequency" placeholder="请输入症状频率" />
        </el-form-item>
        <el-form-item label="症状开始时间" prop="onsetTime">
          <el-date-picker clearable
            v-model="form.onsetTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择症状开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="诱因" prop="triggerFactor">
          <el-input v-model="form.triggerFactor" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="体征描述" prop="physicalSigns">
          <el-input v-model="form.physicalSigns" type="textarea" placeholder="请输入内容" />
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
import { listSymptoms, getSymptoms, delSymptoms, addSymptoms, updateSymptoms } from "@/api/ClinicalSys/symptoms"

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
      // 症状及体征表格数据
      symptomsList: [],
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
    /** 查询症状及体征列表 */
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
        patientId: null,
        symptomDescription: null,
        severityLevel: null,
        frequency: null,
        onsetTime: null,
        triggerFactor: null,
        physicalSigns: null
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
      this.title = "添加症状及体征"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const symptomId = row.symptomId || this.ids
      getSymptoms(symptomId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改症状及体征"
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
      this.$modal.confirm('是否确认删除症状及体征编号为"' + symptomIds + '"的数据项？').then(function() {
        return delSymptoms(symptomIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ClinicalSys/symptoms/export', {
        ...this.queryParams
      }, `symptoms_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
