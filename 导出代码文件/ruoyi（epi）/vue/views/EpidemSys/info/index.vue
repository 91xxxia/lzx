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
          v-hasPermi="['EpidemSys:info:add']"
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
          v-hasPermi="['EpidemSys:info:edit']"
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
          v-hasPermi="['EpidemSys:info:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:info:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="infoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="基本信息号" align="center" prop="surveyId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="调查时间" align="center" prop="surveyDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.surveyDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="姓名" align="center" prop="childName" />
      <el-table-column label="性别" align="center" prop="gender" />
      <el-table-column label="年龄" align="center" prop="age" />
      <el-table-column label="居住地类型" align="center" prop="residenceType" />
      <el-table-column label="居住时长" align="center" prop="residenceYears" />
      <el-table-column label="家庭住址" align="center" prop="address" />
      <el-table-column label="身高" align="center" prop="height" />
      <el-table-column label="体重" align="center" prop="weight" />
      <el-table-column label="既往过敏史" align="center" prop="allergyHistory" />
      <el-table-column label="既往鼻炎" align="center" prop="hasRhinitis" />
      <el-table-column label="既往哮喘" align="center" prop="hasAsthma" />
      <el-table-column label="既往皮炎" align="center" prop="hasDermatitis" />
      <el-table-column label="既往结膜炎" align="center" prop="hasConjunctivitis" />
      <el-table-column label="既往荨麻疹" align="center" prop="hasUrticaria" />
      <el-table-column label="诊断鼻炎" align="center" prop="diagnosedRhinitis" />
      <el-table-column label="诊断哮喘" align="center" prop="diagnosedAsthma" />
      <el-table-column label="诊断皮炎" align="center" prop="diagnosedDermatitis" />
      <el-table-column label="诊断结膜炎" align="center" prop="diagnosedConjunctivitis" />
      <el-table-column label="诊断荨麻疹" align="center" prop="diagnosedUrticaria" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:info:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:info:remove']"
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

    <!-- 添加或修改患儿基本信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="调查时间" prop="surveyDate">
          <el-date-picker clearable
            v-model="form.surveyDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择调查时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="姓名" prop="childName">
          <el-input v-model="form.childName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-input v-model="form.gender" placeholder="请输入性别" />
        </el-form-item>
        <el-form-item label="年龄" prop="age">
          <el-input v-model="form.age" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="居住地类型" prop="residenceType">
          <el-input v-model="form.residenceType" placeholder="请输入居住地类型" />
        </el-form-item>
        <el-form-item label="居住时长" prop="residenceYears">
          <el-input v-model="form.residenceYears" placeholder="请输入居住时长" />
        </el-form-item>
        <el-form-item label="家庭住址" prop="address">
          <el-input v-model="form.address" placeholder="请输入家庭住址" />
        </el-form-item>
        <el-form-item label="身高" prop="height">
          <el-input v-model="form.height" placeholder="请输入身高" />
        </el-form-item>
        <el-form-item label="体重" prop="weight">
          <el-input v-model="form.weight" placeholder="请输入体重" />
        </el-form-item>
        <el-form-item label="既往过敏史" prop="allergyHistory">
          <el-input v-model="form.allergyHistory" placeholder="请输入既往过敏史" />
        </el-form-item>
        <el-form-item label="既往鼻炎" prop="hasRhinitis">
          <el-input v-model="form.hasRhinitis" placeholder="请输入既往鼻炎" />
        </el-form-item>
        <el-form-item label="既往哮喘" prop="hasAsthma">
          <el-input v-model="form.hasAsthma" placeholder="请输入既往哮喘" />
        </el-form-item>
        <el-form-item label="既往皮炎" prop="hasDermatitis">
          <el-input v-model="form.hasDermatitis" placeholder="请输入既往皮炎" />
        </el-form-item>
        <el-form-item label="既往结膜炎" prop="hasConjunctivitis">
          <el-input v-model="form.hasConjunctivitis" placeholder="请输入既往结膜炎" />
        </el-form-item>
        <el-form-item label="既往荨麻疹" prop="hasUrticaria">
          <el-input v-model="form.hasUrticaria" placeholder="请输入既往荨麻疹" />
        </el-form-item>
        <el-form-item label="诊断鼻炎" prop="diagnosedRhinitis">
          <el-input v-model="form.diagnosedRhinitis" placeholder="请输入诊断鼻炎" />
        </el-form-item>
        <el-form-item label="诊断哮喘" prop="diagnosedAsthma">
          <el-input v-model="form.diagnosedAsthma" placeholder="请输入诊断哮喘" />
        </el-form-item>
        <el-form-item label="诊断皮炎" prop="diagnosedDermatitis">
          <el-input v-model="form.diagnosedDermatitis" placeholder="请输入诊断皮炎" />
        </el-form-item>
        <el-form-item label="诊断结膜炎" prop="diagnosedConjunctivitis">
          <el-input v-model="form.diagnosedConjunctivitis" placeholder="请输入诊断结膜炎" />
        </el-form-item>
        <el-form-item label="诊断荨麻疹" prop="diagnosedUrticaria">
          <el-input v-model="form.diagnosedUrticaria" placeholder="请输入诊断荨麻疹" />
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
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/EpidemSys/info"

export default {
  name: "Info",
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
      // 患儿基本信息表格数据
      infoList: [],
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
    /** 查询患儿基本信息列表 */
    getList() {
      this.loading = true
      listInfo(this.queryParams).then(response => {
        this.infoList = response.rows
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
        surveyId: null,
        patientId: null,
        surveyDate: null,
        childName: null,
        gender: null,
        age: null,
        residenceType: null,
        residenceYears: null,
        address: null,
        height: null,
        weight: null,
        allergyHistory: null,
        hasRhinitis: null,
        hasAsthma: null,
        hasDermatitis: null,
        hasConjunctivitis: null,
        hasUrticaria: null,
        diagnosedRhinitis: null,
        diagnosedAsthma: null,
        diagnosedDermatitis: null,
        diagnosedConjunctivitis: null,
        diagnosedUrticaria: null
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
      this.ids = selection.map(item => item.surveyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加患儿基本信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const surveyId = row.surveyId || this.ids
      getInfo(surveyId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改患儿基本信息"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.surveyId != null) {
            updateInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addInfo(this.form).then(response => {
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
      const surveyIds = row.surveyId || this.ids
      this.$modal.confirm('是否确认删除患儿基本信息编号为"' + surveyIds + '"的数据项？').then(function() {
        return delInfo(surveyIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/info/export', {
        ...this.queryParams
      }, `info_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
