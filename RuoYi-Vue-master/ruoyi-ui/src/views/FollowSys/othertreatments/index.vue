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
          v-hasPermi="['FollowSys:othertreatments:add']"
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
          v-hasPermi="['FollowSys:othertreatments:edit']"
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
          v-hasPermi="['FollowSys:othertreatments:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:othertreatments:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="othertreatmentsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="辅助治疗号" align="center" prop="treatmentId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="治疗方法" align="center" prop="treatmentMethod" />
      <el-table-column label="开始时间" align="center" prop="startDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="终止时间" align="center" prop="endDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="注意事项" align="center" prop="notes" />
      <el-table-column label="支气管镜检查日期" align="center" prop="bronchoscopyDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bronchoscopyDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支气管镜检查结论" align="center" prop="bronchoscopyConclusion" />
      <el-table-column label="支气管镜图片路径" align="center" prop="bronchoscopyImagePath" />
      <el-table-column label="鼻导管" align="center" prop="oxygenNasalCatheter" />
      <el-table-column label="面罩" align="center" prop="oxygenMask" />
      <el-table-column label="高流量给氧" align="center" prop="oxygenHighFlow" />
      <el-table-column label="机械通气" align="center" prop="mechanicalVentilation" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:othertreatments:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:othertreatments:remove']"
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

    <!-- 添加或修改其他辅助治疗对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="治疗方法" prop="treatmentMethod">
          <el-input v-model="form.treatmentMethod" placeholder="请输入治疗方法" />
        </el-form-item>
        <el-form-item label="开始时间" prop="startDate">
          <el-date-picker clearable
            v-model="form.startDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="终止时间" prop="endDate">
          <el-date-picker clearable
            v-model="form.endDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择终止时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="注意事项" prop="notes">
          <el-input v-model="form.notes" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="支气管镜检查日期" prop="bronchoscopyDate">
          <el-date-picker clearable
            v-model="form.bronchoscopyDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择支气管镜检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支气管镜检查结论" prop="bronchoscopyConclusion">
          <el-input v-model="form.bronchoscopyConclusion" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="支气管镜图片路径" prop="bronchoscopyImagePath">
          <el-input v-model="form.bronchoscopyImagePath" placeholder="请输入支气管镜图片路径" />
        </el-form-item>
        <el-form-item label="鼻导管" prop="oxygenNasalCatheter">
          <el-input v-model="form.oxygenNasalCatheter" placeholder="请输入鼻导管" />
        </el-form-item>
        <el-form-item label="面罩" prop="oxygenMask">
          <el-input v-model="form.oxygenMask" placeholder="请输入面罩" />
        </el-form-item>
        <el-form-item label="高流量给氧" prop="oxygenHighFlow">
          <el-input v-model="form.oxygenHighFlow" placeholder="请输入高流量给氧" />
        </el-form-item>
        <el-form-item label="机械通气" prop="mechanicalVentilation">
          <el-input v-model="form.mechanicalVentilation" placeholder="请输入机械通气" />
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
import { listOthertreatments, getOthertreatments, delOthertreatments, addOthertreatments, updateOthertreatments } from "@/api/FollowSys/othertreatments"

export default {
  name: "Othertreatments",
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
      // 其他辅助治疗表格数据
      othertreatmentsList: [],
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
    /** 查询其他辅助治疗列表 */
    getList() {
      this.loading = true
      listOthertreatments(this.queryParams).then(response => {
        this.othertreatmentsList = response.rows
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
        treatmentId: null,
        patientId: null,
        treatmentMethod: null,
        startDate: null,
        endDate: null,
        notes: null,
        bronchoscopyDate: null,
        bronchoscopyConclusion: null,
        bronchoscopyImagePath: null,
        oxygenNasalCatheter: null,
        oxygenMask: null,
        oxygenHighFlow: null,
        mechanicalVentilation: null
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
      this.ids = selection.map(item => item.treatmentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加其他辅助治疗"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const treatmentId = row.treatmentId || this.ids
      getOthertreatments(treatmentId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改其他辅助治疗"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.treatmentId != null) {
            updateOthertreatments(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addOthertreatments(this.form).then(response => {
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
      const treatmentIds = row.treatmentId || this.ids
      this.$modal.confirm('是否确认删除其他辅助治疗编号为"' + treatmentIds + '"的数据项？').then(function() {
        return delOthertreatments(treatmentIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/othertreatments/export', {
        ...this.queryParams
      }, `othertreatments_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
