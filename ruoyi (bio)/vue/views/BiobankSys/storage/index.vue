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
      <el-form-item label="冰箱编号/液氮罐编号" prop="storageLocation">
        <el-input
          v-model="queryParams.storageLocation"
          placeholder="请输入冰箱编号/液氮罐编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="具体位置" prop="storagePosition">
        <el-input
          v-model="queryParams.storagePosition"
          placeholder="请输入具体位置"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="存储温度" prop="storageTemperature">
        <el-input
          v-model="queryParams.storageTemperature"
          placeholder="请输入存储温度"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="冷冻温度" prop="freezeDate">
        <el-date-picker clearable
          v-model="queryParams.freezeDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择冷冻温度">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="冷冻方法" prop="freezeMethod">
        <el-input
          v-model="queryParams.freezeMethod"
          placeholder="请输入冷冻方法"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="冻融循环" prop="freezeThawCycles">
        <el-input
          v-model="queryParams.freezeThawCycles"
          placeholder="请输入冻融循环"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="lastCheckDate">
        <el-date-picker clearable
          v-model="queryParams.lastCheckDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择${comment}">
        </el-date-picker>
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
          v-hasPermi="['BiobankSys:storage:add']"
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
          v-hasPermi="['BiobankSys:storage:edit']"
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
          v-hasPermi="['BiobankSys:storage:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['BiobankSys:storage:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="storageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="存储号" align="center" prop="storageId" />
      <el-table-column label="样本号" align="center" prop="specimenId" />
      <el-table-column label="冰箱编号/液氮罐编号" align="center" prop="storageLocation" />
      <el-table-column label="具体位置" align="center" prop="storagePosition" />
      <el-table-column label="存储温度" align="center" prop="storageTemperature" />
      <el-table-column label="冷冻温度" align="center" prop="freezeDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.freezeDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="冷冻方法" align="center" prop="freezeMethod" />
      <el-table-column label="冻融循环" align="center" prop="freezeThawCycles" />
      <el-table-column label="存储状态" align="center" prop="storageStatus" />
      <el-table-column label="${comment}" align="center" prop="lastCheckDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastCheckDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['BiobankSys:storage:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['BiobankSys:storage:remove']"
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

    <!-- 添加或修改样本存储条件对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="样本号" prop="specimenId">
          <el-input v-model="form.specimenId" placeholder="请输入样本号" />
        </el-form-item>
        <el-form-item label="冰箱编号/液氮罐编号" prop="storageLocation">
          <el-input v-model="form.storageLocation" placeholder="请输入冰箱编号/液氮罐编号" />
        </el-form-item>
        <el-form-item label="具体位置" prop="storagePosition">
          <el-input v-model="form.storagePosition" placeholder="请输入具体位置" />
        </el-form-item>
        <el-form-item label="存储温度" prop="storageTemperature">
          <el-input v-model="form.storageTemperature" placeholder="请输入存储温度" />
        </el-form-item>
        <el-form-item label="冷冻温度" prop="freezeDate">
          <el-date-picker clearable
            v-model="form.freezeDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择冷冻温度">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="冷冻方法" prop="freezeMethod">
          <el-input v-model="form.freezeMethod" placeholder="请输入冷冻方法" />
        </el-form-item>
        <el-form-item label="冻融循环" prop="freezeThawCycles">
          <el-input v-model="form.freezeThawCycles" placeholder="请输入冻融循环" />
        </el-form-item>
        <el-form-item label="${comment}" prop="lastCheckDate">
          <el-date-picker clearable
            v-model="form.lastCheckDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择${comment}">
          </el-date-picker>
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
import { listStorage, getStorage, delStorage, addStorage, updateStorage } from "@/api/BiobankSys/storage"

export default {
  name: "Storage",
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
      // 样本存储条件表格数据
      storageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        specimenId: null,
        storageLocation: null,
        storagePosition: null,
        storageTemperature: null,
        freezeDate: null,
        freezeMethod: null,
        freezeThawCycles: null,
        storageStatus: null,
        lastCheckDate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        specimenId: [
          { required: true, message: "样本号不能为空", trigger: "blur" }
        ],
        storageLocation: [
          { required: true, message: "冰箱编号/液氮罐编号不能为空", trigger: "blur" }
        ],
        storageTemperature: [
          { required: true, message: "存储温度不能为空", trigger: "blur" }
        ],
        freezeDate: [
          { required: true, message: "冷冻温度不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询样本存储条件列表 */
    getList() {
      this.loading = true
      listStorage(this.queryParams).then(response => {
        this.storageList = response.rows
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
        storageId: null,
        specimenId: null,
        storageLocation: null,
        storagePosition: null,
        storageTemperature: null,
        freezeDate: null,
        freezeMethod: null,
        freezeThawCycles: null,
        storageStatus: null,
        lastCheckDate: null
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
      this.ids = selection.map(item => item.storageId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加样本存储条件"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const storageId = row.storageId || this.ids
      getStorage(storageId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改样本存储条件"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.storageId != null) {
            updateStorage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addStorage(this.form).then(response => {
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
      const storageIds = row.storageId || this.ids
      this.$modal.confirm('是否确认删除样本存储条件编号为"' + storageIds + '"的数据项？').then(function() {
        return delStorage(storageIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('BiobankSys/storage/export', {
        ...this.queryParams
      }, `storage_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
