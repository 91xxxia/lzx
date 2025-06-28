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
          v-hasPermi="['FollowSys:medicinehistory:add']"
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
          v-hasPermi="['FollowSys:medicinehistory:edit']"
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
          v-hasPermi="['FollowSys:medicinehistory:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:medicinehistory:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicinehistoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="既往用药号" align="center" prop="medHistId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="头孢类使用天数" align="center" prop="cephalosporinsDays" />
      <el-table-column label="大环内酯类使用天数" align="center" prop="macrolidesDays" />
      <el-table-column label="糖皮质使用天数" align="center" prop="corticosteroidsDays" />
      <el-table-column label="抗组胺药使用天数" align="center" prop="antihistaminesDays" />
      <el-table-column label="白三烯受体使用天数" align="center" prop="ltraDays" />
      <el-table-column label="祛痰药使用天数" align="center" prop="expectorantsDays" />
      <el-table-column label="环孢素使用天数" align="center" prop="cyclosporineDays" />
      <el-table-column label="阿布希替尼使用天数" align="center" prop="abrocitinibDays" />
      <el-table-column label="乌帕替尼使用天数" align="center" prop="upadacitinibDays" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:medicinehistory:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:medicinehistory:remove']"
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

    <!-- 添加或修改既往用药史对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="头孢类使用天数" prop="cephalosporinsDays">
          <el-input v-model="form.cephalosporinsDays" placeholder="请输入头孢类使用天数" />
        </el-form-item>
        <el-form-item label="大环内酯类使用天数" prop="macrolidesDays">
          <el-input v-model="form.macrolidesDays" placeholder="请输入大环内酯类使用天数" />
        </el-form-item>
        <el-form-item label="糖皮质使用天数" prop="corticosteroidsDays">
          <el-input v-model="form.corticosteroidsDays" placeholder="请输入糖皮质使用天数" />
        </el-form-item>
        <el-form-item label="抗组胺药使用天数" prop="antihistaminesDays">
          <el-input v-model="form.antihistaminesDays" placeholder="请输入抗组胺药使用天数" />
        </el-form-item>
        <el-form-item label="白三烯受体使用天数" prop="ltraDays">
          <el-input v-model="form.ltraDays" placeholder="请输入白三烯受体使用天数" />
        </el-form-item>
        <el-form-item label="祛痰药使用天数" prop="expectorantsDays">
          <el-input v-model="form.expectorantsDays" placeholder="请输入祛痰药使用天数" />
        </el-form-item>
        <el-form-item label="环孢素使用天数" prop="cyclosporineDays">
          <el-input v-model="form.cyclosporineDays" placeholder="请输入环孢素使用天数" />
        </el-form-item>
        <el-form-item label="阿布希替尼使用天数" prop="abrocitinibDays">
          <el-input v-model="form.abrocitinibDays" placeholder="请输入阿布希替尼使用天数" />
        </el-form-item>
        <el-form-item label="乌帕替尼使用天数" prop="upadacitinibDays">
          <el-input v-model="form.upadacitinibDays" placeholder="请输入乌帕替尼使用天数" />
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
import { listMedicinehistory, getMedicinehistory, delMedicinehistory, addMedicinehistory, updateMedicinehistory } from "@/api/FollowSys/medicinehistory"

export default {
  name: "Medicinehistory",
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
      // 既往用药史表格数据
      medicinehistoryList: [],
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
    /** 查询既往用药史列表 */
    getList() {
      this.loading = true
      listMedicinehistory(this.queryParams).then(response => {
        this.medicinehistoryList = response.rows
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
        medHistId: null,
        patientId: null,
        cephalosporinsDays: null,
        macrolidesDays: null,
        corticosteroidsDays: null,
        antihistaminesDays: null,
        ltraDays: null,
        expectorantsDays: null,
        cyclosporineDays: null,
        abrocitinibDays: null,
        upadacitinibDays: null
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
      this.ids = selection.map(item => item.medHistId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加既往用药史"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const medHistId = row.medHistId || this.ids
      getMedicinehistory(medHistId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改既往用药史"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.medHistId != null) {
            updateMedicinehistory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMedicinehistory(this.form).then(response => {
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
      const medHistIds = row.medHistId || this.ids
      this.$modal.confirm('是否确认删除既往用药史编号为"' + medHistIds + '"的数据项？').then(function() {
        return delMedicinehistory(medHistIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/medicinehistory/export', {
        ...this.queryParams
      }, `medicinehistory_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
