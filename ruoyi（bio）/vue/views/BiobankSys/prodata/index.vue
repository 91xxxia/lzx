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
          v-hasPermi="['BiobankSys:prodata:add']"
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
          v-hasPermi="['BiobankSys:prodata:edit']"
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
          v-hasPermi="['BiobankSys:prodata:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:prodata:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="prodataList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="蛋白质号" align="center" prop="proteomicId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="分析日期" align="center" prop="analysisDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.analysisDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="分析方法" align="center" prop="analysisMethod" />
      <el-table-column label="il4水平" align="center" prop="il4Level" />
      <el-table-column label="il5水平" align="center" prop="il5Level" />
      <el-table-column label="il13水平" align="center" prop="il13Level" />
      <el-table-column label="ige水平" align="center" prop="igeLevel" />
      <el-table-column label="细胞动力学" align="center" prop="cytokineProfile" />
      <el-table-column label="数据文件路径" align="center" prop="dataFilePath" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:prodata:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:prodata:remove']"
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

    <!-- 添加或修改蛋白质组数据对话框 -->
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
        <el-form-item label="分析方法" prop="analysisMethod">
          <el-input v-model="form.analysisMethod" placeholder="请输入分析方法" />
        </el-form-item>
        <el-form-item label="il4水平" prop="il4Level">
          <el-input v-model="form.il4Level" placeholder="请输入il4水平" />
        </el-form-item>
        <el-form-item label="il5水平" prop="il5Level">
          <el-input v-model="form.il5Level" placeholder="请输入il5水平" />
        </el-form-item>
        <el-form-item label="il13水平" prop="il13Level">
          <el-input v-model="form.il13Level" placeholder="请输入il13水平" />
        </el-form-item>
        <el-form-item label="ige水平" prop="igeLevel">
          <el-input v-model="form.igeLevel" placeholder="请输入ige水平" />
        </el-form-item>
        <el-form-item label="细胞动力学" prop="cytokineProfile">
          <el-input v-model="form.cytokineProfile" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="数据文件路径" prop="dataFilePath">
          <el-input v-model="form.dataFilePath" placeholder="请输入数据文件路径" />
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
import { listProdata, getProdata, delProdata, addProdata, updateProdata } from "@/api/BiobankSys/prodata"

export default {
  name: "Prodata",
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
      // 蛋白质组数据表格数据
      prodataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
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
    /** 查询蛋白质组数据列表 */
    getList() {
      this.loading = true
      listProdata(this.queryParams).then(response => {
        this.prodataList = response.rows
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
        proteomicId: null,
        specimenId: null,
        analysisDate: null,
        analysisMethod: null,
        il4Level: null,
        il5Level: null,
        il13Level: null,
        igeLevel: null,
        cytokineProfile: null,
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
      this.ids = selection.map(item => item.proteomicId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加蛋白质组数据"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const proteomicId = row.proteomicId || this.ids
      getProdata(proteomicId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改蛋白质组数据"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.proteomicId != null) {
            updateProdata(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addProdata(this.form).then(response => {
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
      const proteomicIds = row.proteomicId || this.ids
      this.$modal.confirm('是否确认删除蛋白质组数据编号为"' + proteomicIds + '"的数据项？').then(function() {
        return delProdata(proteomicIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/prodata/export', {
        ...this.queryParams
      }, `prodata_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
