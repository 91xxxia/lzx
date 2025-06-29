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
          v-hasPermi="['BiobankSys:biospecimens:add']"
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
          v-hasPermi="['BiobankSys:biospecimens:edit']"
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
          v-hasPermi="['BiobankSys:biospecimens:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:biospecimens:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="biospecimensList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="病人号" align="center" prop="patientId" />
      <el-table-column label="样本类型" align="center" prop="specimenType" />
      <el-table-column label="收集时间" align="center" prop="collectionDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.collectionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收集位置" align="center" prop="collectionSite" />
      <el-table-column label="收集方法" align="center" prop="collectionMethod" />
      <el-table-column label="收集体积" align="center" prop="collectionVolume" />
      <el-table-column label="收集管类型" align="center" prop="collectionTubeType" />
      <el-table-column label="处理方法" align="center" prop="processingMethod" />
      <el-table-column label="初始处理时间" align="center" prop="initialProcessingTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.initialProcessingTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="试样计数" align="center" prop="aliquotCount" />
      <el-table-column label="临床文本" align="center" prop="clinicalContext" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:biospecimens:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:biospecimens:remove']"
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

    <!-- 添加或修改样本采集主表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="病人号" prop="patientId">
          <el-input v-model="form.patientId" placeholder="请输入病人号" />
        </el-form-item>
        <el-form-item label="样本类型" prop="specimenType">
          <el-input v-model="form.specimenType" placeholder="请输入样本类型" />
        </el-form-item>
        <el-form-item label="收集时间" prop="collectionDate">
          <el-date-picker clearable
            v-model="form.collectionDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择收集时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="收集位置" prop="collectionSite">
          <el-input v-model="form.collectionSite" placeholder="请输入收集位置" />
        </el-form-item>
        <el-form-item label="收集方法" prop="collectionMethod">
          <el-input v-model="form.collectionMethod" placeholder="请输入收集方法" />
        </el-form-item>
        <el-form-item label="收集体积" prop="collectionVolume">
          <el-input v-model="form.collectionVolume" placeholder="请输入收集体积" />
        </el-form-item>
        <el-form-item label="收集管类型" prop="collectionTubeType">
          <el-input v-model="form.collectionTubeType" placeholder="请输入收集管类型" />
        </el-form-item>
        <el-form-item label="处理方法" prop="processingMethod">
          <el-input v-model="form.processingMethod" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="初始处理时间" prop="initialProcessingTime">
          <el-date-picker clearable
            v-model="form.initialProcessingTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择初始处理时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="试样计数" prop="aliquotCount">
          <el-input v-model="form.aliquotCount" placeholder="请输入试样计数" />
        </el-form-item>
        <el-form-item label="临床文本" prop="clinicalContext">
          <el-input v-model="form.clinicalContext" type="textarea" placeholder="请输入内容" />
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
import { listBiospecimens, getBiospecimens, delBiospecimens, addBiospecimens, updateBiospecimens } from "@/api/BiobankSys/biospecimens"

export default {
  name: "Biospecimens",
  data() {
    return {
      // 添加新记录标识
      isNewRecord: true,
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
      // 样本采集主表表格数据
      biospecimensList: [],
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
        specimenId: [ // 添加样本号验证规则
          { required: true, message: "样本号不能为空", trigger: "blur" },
          { min: 1, max: 20, message: "长度在 1 到 20 个字符", trigger: "blur" }
        ],
        patientId: [
          { required: true, message: "病人号不能为空", trigger: "blur" }
        ],
        specimenType: [
          { required: true, message: "样本类型不能为空", trigger: "blur" }
        ],
        collectionDate: [
          { required: true, message: "收集时间不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本采集主表"
      this.isNewRecord = true // 标记为新记录
    },
    /** 查询样本采集主表列表 */
    getList() {
      this.loading = true
      listBiospecimens(this.queryParams).then(response => {
        this.biospecimensList = response.rows
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
        specimenId: null,
        patientId: null,
        specimenType: null,
        collectionDate: null,
        collectionSite: null,
        collectionMethod: null,
        collectionVolume: null,
        collectionTubeType: null,
        processingMethod: null,
        initialProcessingTime: null,
        aliquotCount: null,
        clinicalContext: null
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
      this.ids = selection.map(item => item.specimenId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本采集主表"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const specimenId = row.specimenId
      getBiospecimens(specimenId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改样本采集主表"
        this.isNewRecord = false // 标记为更新记录
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 修改判断逻辑：只有specimenId存在且不是新增时才更新
          if (this.form.specimenId && !this.isNewRecord) {
            updateBiospecimens(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            }).catch(error => {
              this.$modal.msgError("修改失败: " + (error.msg || error.message))
            })
          } else {
            // 新增操作
            addBiospecimens(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            }).catch(error => {
              this.$modal.msgError("新增失败: " + (error.msg || error.message))
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const specimenIds = row.specimenId || this.ids
      this.$modal.confirm('是否确认删除样本采集主表编号为"' + specimenIds + '"的数据项？').then(function() {
        return delBiospecimens(specimenIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/biospecimens/export', {
        ...this.queryParams
      }, `biospecimens_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
