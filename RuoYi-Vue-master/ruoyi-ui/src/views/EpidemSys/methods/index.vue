<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="患者号" prop="surveyId">
        <el-input
          v-model="queryParams.surveyId"
          placeholder="请输入患者号"
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
          v-hasPermi="['EpidemSys:methods:add']"
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
          v-hasPermi="['EpidemSys:methods:edit']"
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
          v-hasPermi="['EpidemSys:methods:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['EpidemSys:methods:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="methodsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="方法号" align="center" prop="methodId" />
      <el-table-column label="患者号" align="center" prop="surveyId" />
      <el-table-column label="pm2.5监测仪器号" align="center" prop="pm25DetectorModel" />
      <el-table-column label="花粉重力沉降法" align="center" prop="pollenGravitySettle" />
      <el-table-column label="花粉体积采样法" align="center" prop="pollenVolumeSampling" />
      <el-table-column label="花粉分子检测法" align="center" prop="pollenMolecularDetection" />
      <el-table-column label="尘螨过敏原蛋白检测法" align="center" prop="miteProteinDetection" />
      <el-table-column label="尘螨显微镜直接计数法" align="center" prop="miteMicroscopeCount" />
      <el-table-column label="尘螨PCR分子检测法" align="center" prop="mitePcr" />
      <el-table-column label="尘螨代谢产物检测法" align="center" prop="miteMetabolite" />
      <el-table-column label="尘螨空气采样法" align="center" prop="miteAirSampling" />
      <el-table-column label="尘螨环境传感器技术" align="center" prop="miteSensorTech" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['EpidemSys:methods:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['EpidemSys:methods:remove']"
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

    <!-- 添加或修改环境监测方法对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="患者号" prop="surveyId">
          <el-input v-model="form.surveyId" placeholder="请输入患者号" />
        </el-form-item>
        <el-form-item label="pm2.5监测仪器号" prop="pm25DetectorModel">
          <el-input v-model="form.pm25DetectorModel" placeholder="请输入pm2.5监测仪器号" />
        </el-form-item>
        <el-form-item label="花粉重力沉降法" prop="pollenGravitySettle">
          <el-input v-model="form.pollenGravitySettle" placeholder="请输入花粉重力沉降法" />
        </el-form-item>
        <el-form-item label="花粉体积采样法" prop="pollenVolumeSampling">
          <el-input v-model="form.pollenVolumeSampling" placeholder="请输入花粉体积采样法" />
        </el-form-item>
        <el-form-item label="花粉分子检测法" prop="pollenMolecularDetection">
          <el-input v-model="form.pollenMolecularDetection" placeholder="请输入花粉分子检测法" />
        </el-form-item>
        <el-form-item label="尘螨过敏原蛋白检测法" prop="miteProteinDetection">
          <el-input v-model="form.miteProteinDetection" placeholder="请输入尘螨过敏原蛋白检测法" />
        </el-form-item>
        <el-form-item label="尘螨显微镜直接计数法" prop="miteMicroscopeCount">
          <el-input v-model="form.miteMicroscopeCount" placeholder="请输入尘螨显微镜直接计数法" />
        </el-form-item>
        <el-form-item label="尘螨PCR分子检测法" prop="mitePcr">
          <el-input v-model="form.mitePcr" placeholder="请输入尘螨PCR分子检测法" />
        </el-form-item>
        <el-form-item label="尘螨代谢产物检测法" prop="miteMetabolite">
          <el-input v-model="form.miteMetabolite" placeholder="请输入尘螨代谢产物检测法" />
        </el-form-item>
        <el-form-item label="尘螨空气采样法" prop="miteAirSampling">
          <el-input v-model="form.miteAirSampling" placeholder="请输入尘螨空气采样法" />
        </el-form-item>
        <el-form-item label="尘螨环境传感器技术" prop="miteSensorTech">
          <el-input v-model="form.miteSensorTech" placeholder="请输入尘螨环境传感器技术" />
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
import { listMethods, getMethods, delMethods, addMethods, updateMethods } from "@/api/EpidemSys/methods"

export default {
  name: "Methods",
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
      // 环境监测方法表格数据
      methodsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        surveyId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        surveyId: [
          { required: true, message: "患者号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询环境监测方法列表 */
    getList() {
      this.loading = true
      listMethods(this.queryParams).then(response => {
        this.methodsList = response.rows
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
        methodId: null,
        surveyId: null,
        pm25DetectorModel: null,
        pollenGravitySettle: null,
        pollenVolumeSampling: null,
        pollenMolecularDetection: null,
        miteProteinDetection: null,
        miteMicroscopeCount: null,
        mitePcr: null,
        miteMetabolite: null,
        miteAirSampling: null,
        miteSensorTech: null
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
      this.ids = selection.map(item => item.methodId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加环境监测方法"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const methodId = row.methodId || this.ids
      getMethods(methodId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改环境监测方法"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.methodId != null) {
            updateMethods(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addMethods(this.form).then(response => {
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
      const methodIds = row.methodId || this.ids
      this.$modal.confirm('是否确认删除环境监测方法编号为"' + methodIds + '"的数据项？').then(function() {
        return delMethods(methodIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('EpidemSys/methods/export', {
        ...this.queryParams
      }, `methods_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
