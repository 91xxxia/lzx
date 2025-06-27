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
      <el-form-item label="分析平台" prop="analysisPlatform">
        <el-input
          v-model="queryParams.analysisPlatform"
          placeholder="请输入分析平台"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="IL-4基因型" prop="il4Genotype">
        <el-input
          v-model="queryParams.il4Genotype"
          placeholder="请输入IL-4基因型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="IL-13基因型" prop="il13Genotype">
        <el-input
          v-model="queryParams.il13Genotype"
          placeholder="请输入IL-13基因型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="丝聚蛋白突变" prop="filaggrinMutation">
        <el-input
          v-model="queryParams.filaggrinMutation"
          placeholder="请输入丝聚蛋白突变"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="TSLP基因变异" prop="tslpVariant">
        <el-input
          v-model="queryParams.tslpVariant"
          placeholder="请输入TSLP基因变异"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="存储其他SNP位点数据" prop="otherSnpData">
        <el-input
          v-model="queryParams.otherSnpData"
          placeholder="请输入存储其他SNP位点数据"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="覆盖顺序" prop="sequencingCoverage">
        <el-input
          v-model="queryParams.sequencingCoverage"
          placeholder="请输入覆盖顺序"
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
      <el-form-item label="分析协议" prop="analysisProtocol">
        <el-input
          v-model="queryParams.analysisProtocol"
          placeholder="请输入分析协议"
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
          v-hasPermi="['BiobankSys:data:add']"
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
          v-hasPermi="['BiobankSys:data:edit']"
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
          v-hasPermi="['BiobankSys:data:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:data:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="基因号" align="center" prop="genomicId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="分析日期" align="center" prop="analysisDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.analysisDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="分析平台" align="center" prop="analysisPlatform" />
      <el-table-column label="IL-4基因型" align="center" prop="il4Genotype" />
      <el-table-column label="IL-13基因型" align="center" prop="il13Genotype" />
      <el-table-column label="丝聚蛋白突变" align="center" prop="filaggrinMutation" />
      <el-table-column label="TSLP基因变异" align="center" prop="tslpVariant" />
      <el-table-column label="存储其他SNP位点数据" align="center" prop="otherSnpData" />
      <el-table-column label="覆盖顺序" align="center" prop="sequencingCoverage" />
      <el-table-column label="日期文件路径" align="center" prop="dataFilePath" />
      <el-table-column label="分析协议" align="center" prop="analysisProtocol" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:data:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:data:remove']"
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

    <!-- 添加或修改基因组数据对话框 -->
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
        <el-form-item label="分析平台" prop="analysisPlatform">
          <el-input v-model="form.analysisPlatform" placeholder="请输入分析平台" />
        </el-form-item>
        <el-form-item label="IL-4基因型" prop="il4Genotype">
          <el-input v-model="form.il4Genotype" placeholder="请输入IL-4基因型" />
        </el-form-item>
        <el-form-item label="IL-13基因型" prop="il13Genotype">
          <el-input v-model="form.il13Genotype" placeholder="请输入IL-13基因型" />
        </el-form-item>
        <el-form-item label="丝聚蛋白突变" prop="filaggrinMutation">
          <el-input v-model="form.filaggrinMutation" placeholder="请输入丝聚蛋白突变" />
        </el-form-item>
        <el-form-item label="TSLP基因变异" prop="tslpVariant">
          <el-input v-model="form.tslpVariant" placeholder="请输入TSLP基因变异" />
        </el-form-item>
        <el-form-item label="存储其他SNP位点数据" prop="otherSnpData">
          <el-input v-model="form.otherSnpData" placeholder="请输入存储其他SNP位点数据" />
        </el-form-item>
        <el-form-item label="覆盖顺序" prop="sequencingCoverage">
          <el-input v-model="form.sequencingCoverage" placeholder="请输入覆盖顺序" />
        </el-form-item>
        <el-form-item label="日期文件路径" prop="dataFilePath">
          <el-input v-model="form.dataFilePath" placeholder="请输入日期文件路径" />
        </el-form-item>
        <el-form-item label="分析协议" prop="analysisProtocol">
          <el-input v-model="form.analysisProtocol" placeholder="请输入分析协议" />
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
import { listData, getData, delData, addData, updateData } from "@/api/BiobankSys/data"

export default {
  name: "Data",
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
      // 基因组数据表格数据
      dataList: [],
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
        analysisPlatform: null,
        il4Genotype: null,
        il13Genotype: null,
        filaggrinMutation: null,
        tslpVariant: null,
        otherSnpData: null,
        sequencingCoverage: null,
        dataFilePath: null,
        analysisProtocol: null
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
    /** 查询基因组数据列表 */
    getList() {
      this.loading = true
      listData(this.queryParams).then(response => {
        this.dataList = response.rows
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
        genomicId: null,
        specimenId: null,
        analysisDate: null,
        analysisPlatform: null,
        il4Genotype: null,
        il13Genotype: null,
        filaggrinMutation: null,
        tslpVariant: null,
        otherSnpData: null,
        sequencingCoverage: null,
        dataFilePath: null,
        analysisProtocol: null
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
      this.ids = selection.map(item => item.genomicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加基因组数据"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const genomicId = row.genomicId || this.ids
      getData(genomicId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改基因组数据"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.genomicId != null) {
            updateData(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addData(this.form).then(response => {
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
      const genomicIds = row.genomicId || this.ids
      this.$modal.confirm('是否确认删除基因组数据编号为"' + genomicIds + '"的数据项？').then(function() {
        return delData(genomicIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/data/export', {
        ...this.queryParams
      }, `data_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
