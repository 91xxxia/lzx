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
      <el-form-item label="组胺水平" prop="histamineLevel">
        <el-input
          v-model="queryParams.histamineLevel"
          placeholder="请输入组胺水平"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="白三烯水平" prop="leukotrienesLevel">
        <el-input
          v-model="queryParams.leukotrienesLevel"
          placeholder="请输入白三烯水平"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="前列腺素水平" prop="prostaglandinsLevel">
        <el-input
          v-model="queryParams.prostaglandinsLevel"
          placeholder="请输入前列腺素水平"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="其他代谢物数据" prop="otherMetabolites">
        <el-input
          v-model="queryParams.otherMetabolites"
          placeholder="请输入其他代谢物数据"
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
          v-hasPermi="['BiobankSys:metadata:add']"
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
          v-hasPermi="['BiobankSys:metadata:edit']"
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
          v-hasPermi="['BiobankSys:metadata:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:metadata:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="metadataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="代谢组号" align="center" prop="metabolomicId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="分析日期" align="center" prop="analysisDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.analysisDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="分析平台" align="center" prop="analysisPlatform" />
      <el-table-column label="组胺水平" align="center" prop="histamineLevel" />
      <el-table-column label="白三烯水平" align="center" prop="leukotrienesLevel" />
      <el-table-column label="前列腺素水平" align="center" prop="prostaglandinsLevel" />
      <el-table-column label="其他代谢物数据" align="center" prop="otherMetabolites" />
      <el-table-column label="日期文件路径" align="center" prop="dataFilePath" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:metadata:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:metadata:remove']"
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

    <!-- 添加或修改代谢组数据对话框 -->
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
        <el-form-item label="组胺水平" prop="histamineLevel">
          <el-input v-model="form.histamineLevel" placeholder="请输入组胺水平" />
        </el-form-item>
        <el-form-item label="白三烯水平" prop="leukotrienesLevel">
          <el-input v-model="form.leukotrienesLevel" placeholder="请输入白三烯水平" />
        </el-form-item>
        <el-form-item label="前列腺素水平" prop="prostaglandinsLevel">
          <el-input v-model="form.prostaglandinsLevel" placeholder="请输入前列腺素水平" />
        </el-form-item>
        <el-form-item label="其他代谢物数据" prop="otherMetabolites">
          <el-input v-model="form.otherMetabolites" placeholder="请输入其他代谢物数据" />
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
import { listMetadata, getMetadata, delMetadata, addMetadata, updateMetadata } from "@/api/BiobankSys/metadata"

export default {
  name: "Metadata",
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
      // 代谢组数据表格数据
      metadataList: [],
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
        histamineLevel: null,
        leukotrienesLevel: null,
        prostaglandinsLevel: null,
        otherMetabolites: null,
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
    /** 查询代谢组数据列表 */
    getList() {
      this.loading = true
      listMetadata(this.queryParams).then(response => {
        this.metadataList = response.rows
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
        metabolomicId: null,
        specimenId: null,
        analysisDate: null,
        analysisPlatform: null,
        histamineLevel: null,
        leukotrienesLevel: null,
        prostaglandinsLevel: null,
        otherMetabolites: null,
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
      this.ids = selection.map(item => item.metabolomicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加代谢组数据"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const metabolomicId = row.metabolomicId || this.ids
      getMetadata(metabolomicId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改代谢组数据"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.metabolomicId != null) {
            updateMetadata(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMetadata(this.form).then(response => {
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
      const metabolomicIds = row.metabolomicId || this.ids
      this.$modal.confirm('是否确认删除代谢组数据编号为"' + metabolomicIds + '"的数据项？').then(function() {
        return delMetadata(metabolomicIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/metadata/export', {
        ...this.queryParams
      }, `metadata_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
