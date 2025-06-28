<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="样本号" prop="specimenId">
        <el-input
          v-model="queryParams.specimenId"
          placeholder="请输入样本号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分析日期" prop="analysisDate">
        <el-date-picker clearable
          v-model="queryParams.analysisDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择分析日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="排序方法" prop="sequencingMethod">
        <el-input
          v-model="queryParams.sequencingMethod"
          placeholder="请输入排序方法"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="α多样性指数" prop="alphaDiversity">
        <el-input
          v-model="queryParams.alphaDiversity"
          placeholder="请输入α多样性指数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="β多样性指标" prop="betaDiversityMetrics">
        <el-input
          v-model="queryParams.betaDiversityMetrics"
          placeholder="请输入β多样性指标"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优势菌门" prop="predominantPhylum">
        <el-input
          v-model="queryParams.predominantPhylum"
          placeholder="请输入优势菌门"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优势菌属" prop="predominantGenus">
        <el-input
          v-model="queryParams.predominantGenus"
          placeholder="请输入优势菌属"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厚壁菌/拟杆菌比" prop="firmicutesBacteroidetesRatio">
        <el-input
          v-model="queryParams.firmicutesBacteroidetesRatio"
          placeholder="请输入厚壁菌/拟杆菌比"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="病原体检出" prop="pathogenDetected">
        <el-input
          v-model="queryParams.pathogenDetected"
          placeholder="请输入病原体检出"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="完整分类学报告" prop="fullTaxonomyReport">
        <el-input
          v-model="queryParams.fullTaxonomyReport"
          placeholder="请输入完整分类学报告"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日期文件路径" prop="dataFilePath">
        <el-input
          v-model="queryParams.dataFilePath"
          placeholder="请输入日期文件路径"
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
          v-hasPermi="['BiobankSys:microdata:add']"
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
          v-hasPermi="['BiobankSys:microdata:edit']"
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
          v-hasPermi="['BiobankSys:microdata:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:microdata:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="microdataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="微生物组号" align="center" prop="microbiomeId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="分析日期" align="center" prop="analysisDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.analysisDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="排序方法" align="center" prop="sequencingMethod" />
      <el-table-column label="α多样性指数" align="center" prop="alphaDiversity" />
      <el-table-column label="β多样性指标" align="center" prop="betaDiversityMetrics" />
      <el-table-column label="优势菌门" align="center" prop="predominantPhylum" />
      <el-table-column label="优势菌属" align="center" prop="predominantGenus" />
      <el-table-column label="厚壁菌/拟杆菌比" align="center" prop="firmicutesBacteroidetesRatio" />
      <el-table-column label="病原体检出" align="center" prop="pathogenDetected" />
      <el-table-column label="完整分类学报告" align="center" prop="fullTaxonomyReport" />
      <el-table-column label="日期文件路径" align="center" prop="dataFilePath" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:microdata:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:microdata:remove']"
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

    <!-- 添加或修改微生物组数据对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="分析日期" prop="analysisDate">
          <el-date-picker clearable
            v-model="form.analysisDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择分析日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="排序方法" prop="sequencingMethod">
          <el-input v-model="form.sequencingMethod" placeholder="请输入排序方法" />
        </el-form-item>
        <el-form-item label="α多样性指数" prop="alphaDiversity">
          <el-input v-model="form.alphaDiversity" placeholder="请输入α多样性指数" />
        </el-form-item>
        <el-form-item label="β多样性指标" prop="betaDiversityMetrics">
          <el-input v-model="form.betaDiversityMetrics" placeholder="请输入β多样性指标" />
        </el-form-item>
        <el-form-item label="优势菌门" prop="predominantPhylum">
          <el-input v-model="form.predominantPhylum" placeholder="请输入优势菌门" />
        </el-form-item>
        <el-form-item label="优势菌属" prop="predominantGenus">
          <el-input v-model="form.predominantGenus" placeholder="请输入优势菌属" />
        </el-form-item>
        <el-form-item label="厚壁菌/拟杆菌比" prop="firmicutesBacteroidetesRatio">
          <el-input v-model="form.firmicutesBacteroidetesRatio" placeholder="请输入厚壁菌/拟杆菌比" />
        </el-form-item>
        <el-form-item label="病原体检出" prop="pathogenDetected">
          <el-input v-model="form.pathogenDetected" placeholder="请输入病原体检出" />
        </el-form-item>
        <el-form-item label="完整分类学报告" prop="fullTaxonomyReport">
          <el-input v-model="form.fullTaxonomyReport" placeholder="请输入完整分类学报告" />
        </el-form-item>
        <el-form-item label="日期文件路径" prop="dataFilePath">
          <el-input v-model="form.dataFilePath" placeholder="请输入日期文件路径" />
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
import { listMicrodata, getMicrodata, delMicrodata, addMicrodata, updateMicrodata } from "@/api/BiobankSys/microdata"

export default {
  name: "Microdata",
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
      // 微生物组数据表格数据
      microdataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
        analysisDate: null,
        sequencingMethod: null,
        alphaDiversity: null,
        betaDiversityMetrics: null,
        predominantPhylum: null,
        predominantGenus: null,
        firmicutesBacteroidetesRatio: null,
        pathogenDetected: null,
        fullTaxonomyReport: null,
        dataFilePath: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        specimenId: [
          { required: true, message: "样本号不能为空", trigger: "blur" }
        ],
        analysisDate: [
          { required: true, message: "分析日期不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询微生物组数据列表 */
    getList() {
      this.loading = true
      listMicrodata(this.queryParams).then(response => {
        this.microdataList = response.rows
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
        microbiomeId: null,
        specimenId: null,
        analysisDate: null,
        sequencingMethod: null,
        alphaDiversity: null,
        betaDiversityMetrics: null,
        predominantPhylum: null,
        predominantGenus: null,
        firmicutesBacteroidetesRatio: null,
        pathogenDetected: null,
        fullTaxonomyReport: null,
        dataFilePath: null
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
      this.ids = selection.map(item => item.microbiomeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加微生物组数据"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const microbiomeId = row.microbiomeId || this.ids
      getMicrodata(microbiomeId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改微生物组数据"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.microbiomeId != null) {
            updateMicrodata(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMicrodata(this.form).then(response => {
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
      const microbiomeIds = row.microbiomeId || this.ids
      this.$modal.confirm('是否确认删除微生物组数据编号为"' + microbiomeIds + '"的数据项？').then(function() {
        return delMicrodata(microbiomeIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/microdata/export', {
        ...this.queryParams
      }, `microdata_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
