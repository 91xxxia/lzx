<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="药物名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入药物名称"
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
          v-hasPermi="['FollowSys:catalog:add']"
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
          v-hasPermi="['FollowSys:catalog:edit']"
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
          v-hasPermi="['FollowSys:catalog:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:catalog:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="catalogList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="药物记录号" align="center" prop="drugId" />
      <el-table-column label="药物名称" align="center" prop="name" />
      <el-table-column label="药物品牌" align="center" prop="brand" />
      <el-table-column label="药物类型" align="center" prop="type" />
      <el-table-column label="类固醇" align="center" prop="isSteroid" />
      <el-table-column label="抗组胺药" align="center" prop="isAntihistamine" />
      <el-table-column label="白三体受体拮抗剂" align="center" prop="isLtra" />
      <el-table-column label="支气管扩张剂" align="center" prop="isBronchodilator" />
      <el-table-column label="抗生素" align="center" prop="isAntibiotic" />
      <el-table-column label="外用软膏" align="center" prop="isTopical" />
      <el-table-column label="鼻用糖皮质激素" align="center" prop="isNasal" />
      <el-table-column label="祛痰药" align="center" prop="isExpectorant" />
      <el-table-column label="过敏源特异性免疫治疗" align="center" prop="isImmunotherapy" />
      <el-table-column label="抗免疫球蛋白E治疗" align="center" prop="isAntiIge" />
      <el-table-column label="靶向治疗" align="center" prop="isTargeted" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:catalog:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:catalog:remove']"
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

    <!-- 添加或修改药物记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="药物名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入药物名称" />
        </el-form-item>
        <el-form-item label="药物品牌" prop="brand">
          <el-input v-model="form.brand" placeholder="请输入药物品牌" />
        </el-form-item>
        <el-form-item label="药物类型" prop="type">
          <el-input v-model="form.type" placeholder="请输入药物类型" />
        </el-form-item>
        <el-form-item label="类固醇" prop="isSteroid">
          <el-input v-model="form.isSteroid" placeholder="请输入类固醇" />
        </el-form-item>
        <el-form-item label="抗组胺药" prop="isAntihistamine">
          <el-input v-model="form.isAntihistamine" placeholder="请输入抗组胺药" />
        </el-form-item>
        <el-form-item label="白三体受体拮抗剂" prop="isLtra">
          <el-input v-model="form.isLtra" placeholder="请输入白三体受体拮抗剂" />
        </el-form-item>
        <el-form-item label="支气管扩张剂" prop="isBronchodilator">
          <el-input v-model="form.isBronchodilator" placeholder="请输入支气管扩张剂" />
        </el-form-item>
        <el-form-item label="抗生素" prop="isAntibiotic">
          <el-input v-model="form.isAntibiotic" placeholder="请输入抗生素" />
        </el-form-item>
        <el-form-item label="外用软膏" prop="isTopical">
          <el-input v-model="form.isTopical" placeholder="请输入外用软膏" />
        </el-form-item>
        <el-form-item label="鼻用糖皮质激素" prop="isNasal">
          <el-input v-model="form.isNasal" placeholder="请输入鼻用糖皮质激素" />
        </el-form-item>
        <el-form-item label="祛痰药" prop="isExpectorant">
          <el-input v-model="form.isExpectorant" placeholder="请输入祛痰药" />
        </el-form-item>
        <el-form-item label="过敏源特异性免疫治疗" prop="isImmunotherapy">
          <el-input v-model="form.isImmunotherapy" placeholder="请输入过敏源特异性免疫治疗" />
        </el-form-item>
        <el-form-item label="抗免疫球蛋白E治疗" prop="isAntiIge">
          <el-input v-model="form.isAntiIge" placeholder="请输入抗免疫球蛋白E治疗" />
        </el-form-item>
        <el-form-item label="靶向治疗" prop="isTargeted">
          <el-input v-model="form.isTargeted" placeholder="请输入靶向治疗" />
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
import { listCatalog, getCatalog, delCatalog, addCatalog, updateCatalog } from "@/api/FollowSys/catalog"

export default {
  name: "Catalog",
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
      // 药物记录表格数据
      catalogList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "药物名称不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询药物记录列表 */
    getList() {
      this.loading = true
      listCatalog(this.queryParams).then(response => {
        this.catalogList = response.rows
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
        drugId: null,
        name: null,
        brand: null,
        type: null,
        isSteroid: null,
        isAntihistamine: null,
        isLtra: null,
        isBronchodilator: null,
        isAntibiotic: null,
        isTopical: null,
        isNasal: null,
        isExpectorant: null,
        isImmunotherapy: null,
        isAntiIge: null,
        isTargeted: null
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
      this.ids = selection.map(item => item.drugId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加药物记录"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const drugId = row.drugId || this.ids
      getCatalog(drugId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改药物记录"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.drugId != null) {
            updateCatalog(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addCatalog(this.form).then(response => {
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
      const drugIds = row.drugId || this.ids
      this.$modal.confirm('是否确认删除药物记录编号为"' + drugIds + '"的数据项？').then(function() {
        return delCatalog(drugIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/catalog/export', {
        ...this.queryParams
      }, `catalog_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
