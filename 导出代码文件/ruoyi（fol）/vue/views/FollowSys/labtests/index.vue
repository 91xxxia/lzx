<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="随访号" prop="followupId">
        <el-input
          v-model="queryParams.followupId"
          placeholder="请输入随访号"
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
          v-hasPermi="['FollowSys:labtests:add']"
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
          v-hasPermi="['FollowSys:labtests:edit']"
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
          v-hasPermi="['FollowSys:labtests:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['FollowSys:labtests:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="labtestsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="实验室检查号" align="center" prop="labtestId" />
      <el-table-column label="随访号" align="center" prop="followupId" />
      <el-table-column label="血常规检查日期" align="center" prop="bloodTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bloodTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="白细胞计数" align="center" prop="wbcCount" />
      <el-table-column label="中性粒细胞计数" align="center" prop="neutrophilCount" />
      <el-table-column label="淋巴细胞计数" align="center" prop="lymphocyteCount" />
      <el-table-column label="嗜酸性粒细胞计数" align="center" prop="eosinophilCount" />
      <el-table-column label="中性粒细胞百分比" align="center" prop="neutrophilPercent" />
      <el-table-column label="淋巴细胞百分比" align="center" prop="lymphocytePercent" />
      <el-table-column label="嗜酸性粒细胞百分比" align="center" prop="eosinophilPercent" />
      <el-table-column label="血红细胞" align="center" prop="hemoglobin" />
      <el-table-column label="红细胞计数" align="center" prop="rbcCount" />
      <el-table-column label="血小板" align="center" prop="plateletCount" />
      <el-table-column label="C反应蛋白" align="center" prop="cReactiveProtein" />
      <el-table-column label="过敏原检查日期" align="center" prop="allergenComboTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.allergenComboTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总IgE" align="center" prop="totalIge" />
      <el-table-column label="尘螨组合" align="center" prop="dustMiteCombo" />
      <el-table-column label="霉菌组合" align="center" prop="moldCombo" />
      <el-table-column label="宠物毛屑组合" align="center" prop="petDanderCombo" />
      <el-table-column label="常见食物组合" align="center" prop="foodCombo" />
      <el-table-column label="坚果组合" align="center" prop="nutCombo" />
      <el-table-column label="过敏源单项检查日期" align="center" prop="singleAllergenTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.singleAllergenTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房尘螨" align="center" prop="houseDustMite" />
      <el-table-column label="粉尘螨" align="center" prop="dustMite" />
      <el-table-column label="花粉" align="center" prop="pollen" />
      <el-table-column label="杂草" align="center" prop="weed" />
      <el-table-column label="烟曲霉" align="center" prop="aspergillus" />
      <el-table-column label="链格孢" align="center" prop="alternaria" />
      <el-table-column label="蟑螂" align="center" prop="cockroach" />
      <el-table-column label="猫皮屑" align="center" prop="catDander" />
      <el-table-column label="狗皮屑" align="center" prop="dogDander" />
      <el-table-column label="鸡蛋白" align="center" prop="eggWhite" />
      <el-table-column label="牛奶" align="center" prop="milk" />
      <el-table-column label="虾" align="center" prop="shrimp" />
      <el-table-column label="螃蟹" align="center" prop="crab" />
      <el-table-column label="大豆" align="center" prop="soybean" />
      <el-table-column label="芝麻" align="center" prop="sesame" />
      <el-table-column label="小麦" align="center" prop="wheat" />
      <el-table-column label="坚果" align="center" prop="nuts" />
      <el-table-column label="其他" align="center" prop="allergenOther" />
      <el-table-column label="皮肤点刺试验日期" align="center" prop="skinPrickTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.skinPrickTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房尘螨" align="center" prop="prickHouseDustMite" />
      <el-table-column label="粉尘螨" align="center" prop="prickDustMite" />
      <el-table-column label="痰嗜酸性粒细胞检查日期" align="center" prop="sputumEosinophilTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.sputumEosinophilTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="痰嗜酸性粒细胞计数" align="center" prop="sputumEosinophilCount" />
      <el-table-column label="总IgE检查日期" align="center" prop="totalIgeRepeatTestDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.totalIgeRepeatTestDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总IgE值" align="center" prop="totalIgeRepeatValue" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['FollowSys:labtests:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['FollowSys:labtests:remove']"
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

    <!-- 添加或修改实验室检查对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="随访号" prop="followupId">
          <el-input v-model="form.followupId" placeholder="请输入随访号" />
        </el-form-item>
        <el-form-item label="血常规检查日期" prop="bloodTestDate">
          <el-date-picker clearable
            v-model="form.bloodTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择血常规检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="白细胞计数" prop="wbcCount">
          <el-input v-model="form.wbcCount" placeholder="请输入白细胞计数" />
        </el-form-item>
        <el-form-item label="中性粒细胞计数" prop="neutrophilCount">
          <el-input v-model="form.neutrophilCount" placeholder="请输入中性粒细胞计数" />
        </el-form-item>
        <el-form-item label="淋巴细胞计数" prop="lymphocyteCount">
          <el-input v-model="form.lymphocyteCount" placeholder="请输入淋巴细胞计数" />
        </el-form-item>
        <el-form-item label="嗜酸性粒细胞计数" prop="eosinophilCount">
          <el-input v-model="form.eosinophilCount" placeholder="请输入嗜酸性粒细胞计数" />
        </el-form-item>
        <el-form-item label="中性粒细胞百分比" prop="neutrophilPercent">
          <el-input v-model="form.neutrophilPercent" placeholder="请输入中性粒细胞百分比" />
        </el-form-item>
        <el-form-item label="淋巴细胞百分比" prop="lymphocytePercent">
          <el-input v-model="form.lymphocytePercent" placeholder="请输入淋巴细胞百分比" />
        </el-form-item>
        <el-form-item label="嗜酸性粒细胞百分比" prop="eosinophilPercent">
          <el-input v-model="form.eosinophilPercent" placeholder="请输入嗜酸性粒细胞百分比" />
        </el-form-item>
        <el-form-item label="血红细胞" prop="hemoglobin">
          <el-input v-model="form.hemoglobin" placeholder="请输入血红细胞" />
        </el-form-item>
        <el-form-item label="红细胞计数" prop="rbcCount">
          <el-input v-model="form.rbcCount" placeholder="请输入红细胞计数" />
        </el-form-item>
        <el-form-item label="血小板" prop="plateletCount">
          <el-input v-model="form.plateletCount" placeholder="请输入血小板" />
        </el-form-item>
        <el-form-item label="C反应蛋白" prop="cReactiveProtein">
          <el-input v-model="form.cReactiveProtein" placeholder="请输入C反应蛋白" />
        </el-form-item>
        <el-form-item label="过敏原检查日期" prop="allergenComboTestDate">
          <el-date-picker clearable
            v-model="form.allergenComboTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择过敏原检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="总IgE" prop="totalIge">
          <el-input v-model="form.totalIge" placeholder="请输入总IgE" />
        </el-form-item>
        <el-form-item label="尘螨组合" prop="dustMiteCombo">
          <el-input v-model="form.dustMiteCombo" placeholder="请输入尘螨组合" />
        </el-form-item>
        <el-form-item label="霉菌组合" prop="moldCombo">
          <el-input v-model="form.moldCombo" placeholder="请输入霉菌组合" />
        </el-form-item>
        <el-form-item label="宠物毛屑组合" prop="petDanderCombo">
          <el-input v-model="form.petDanderCombo" placeholder="请输入宠物毛屑组合" />
        </el-form-item>
        <el-form-item label="常见食物组合" prop="foodCombo">
          <el-input v-model="form.foodCombo" placeholder="请输入常见食物组合" />
        </el-form-item>
        <el-form-item label="坚果组合" prop="nutCombo">
          <el-input v-model="form.nutCombo" placeholder="请输入坚果组合" />
        </el-form-item>
        <el-form-item label="过敏源单项检查日期" prop="singleAllergenTestDate">
          <el-date-picker clearable
            v-model="form.singleAllergenTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择过敏源单项检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房尘螨" prop="houseDustMite">
          <el-input v-model="form.houseDustMite" placeholder="请输入房尘螨" />
        </el-form-item>
        <el-form-item label="粉尘螨" prop="dustMite">
          <el-input v-model="form.dustMite" placeholder="请输入粉尘螨" />
        </el-form-item>
        <el-form-item label="花粉" prop="pollen">
          <el-input v-model="form.pollen" placeholder="请输入花粉" />
        </el-form-item>
        <el-form-item label="杂草" prop="weed">
          <el-input v-model="form.weed" placeholder="请输入杂草" />
        </el-form-item>
        <el-form-item label="烟曲霉" prop="aspergillus">
          <el-input v-model="form.aspergillus" placeholder="请输入烟曲霉" />
        </el-form-item>
        <el-form-item label="链格孢" prop="alternaria">
          <el-input v-model="form.alternaria" placeholder="请输入链格孢" />
        </el-form-item>
        <el-form-item label="蟑螂" prop="cockroach">
          <el-input v-model="form.cockroach" placeholder="请输入蟑螂" />
        </el-form-item>
        <el-form-item label="猫皮屑" prop="catDander">
          <el-input v-model="form.catDander" placeholder="请输入猫皮屑" />
        </el-form-item>
        <el-form-item label="狗皮屑" prop="dogDander">
          <el-input v-model="form.dogDander" placeholder="请输入狗皮屑" />
        </el-form-item>
        <el-form-item label="鸡蛋白" prop="eggWhite">
          <el-input v-model="form.eggWhite" placeholder="请输入鸡蛋白" />
        </el-form-item>
        <el-form-item label="牛奶" prop="milk">
          <el-input v-model="form.milk" placeholder="请输入牛奶" />
        </el-form-item>
        <el-form-item label="虾" prop="shrimp">
          <el-input v-model="form.shrimp" placeholder="请输入虾" />
        </el-form-item>
        <el-form-item label="螃蟹" prop="crab">
          <el-input v-model="form.crab" placeholder="请输入螃蟹" />
        </el-form-item>
        <el-form-item label="大豆" prop="soybean">
          <el-input v-model="form.soybean" placeholder="请输入大豆" />
        </el-form-item>
        <el-form-item label="芝麻" prop="sesame">
          <el-input v-model="form.sesame" placeholder="请输入芝麻" />
        </el-form-item>
        <el-form-item label="小麦" prop="wheat">
          <el-input v-model="form.wheat" placeholder="请输入小麦" />
        </el-form-item>
        <el-form-item label="坚果" prop="nuts">
          <el-input v-model="form.nuts" placeholder="请输入坚果" />
        </el-form-item>
        <el-form-item label="其他" prop="allergenOther">
          <el-input v-model="form.allergenOther" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="皮肤点刺试验日期" prop="skinPrickTestDate">
          <el-date-picker clearable
            v-model="form.skinPrickTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择皮肤点刺试验日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房尘螨" prop="prickHouseDustMite">
          <el-input v-model="form.prickHouseDustMite" placeholder="请输入房尘螨" />
        </el-form-item>
        <el-form-item label="粉尘螨" prop="prickDustMite">
          <el-input v-model="form.prickDustMite" placeholder="请输入粉尘螨" />
        </el-form-item>
        <el-form-item label="痰嗜酸性粒细胞检查日期" prop="sputumEosinophilTestDate">
          <el-date-picker clearable
            v-model="form.sputumEosinophilTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择痰嗜酸性粒细胞检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="痰嗜酸性粒细胞计数" prop="sputumEosinophilCount">
          <el-input v-model="form.sputumEosinophilCount" placeholder="请输入痰嗜酸性粒细胞计数" />
        </el-form-item>
        <el-form-item label="总IgE检查日期" prop="totalIgeRepeatTestDate">
          <el-date-picker clearable
            v-model="form.totalIgeRepeatTestDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择总IgE检查日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="总IgE值" prop="totalIgeRepeatValue">
          <el-input v-model="form.totalIgeRepeatValue" placeholder="请输入总IgE值" />
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
import { listLabtests, getLabtests, delLabtests, addLabtests, updateLabtests } from "@/api/FollowSys/labtests"

export default {
  name: "Labtests",
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
      // 实验室检查表格数据
      labtestsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        followupId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        followupId: [
          { required: true, message: "随访号不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询实验室检查列表 */
    getList() {
      this.loading = true
      listLabtests(this.queryParams).then(response => {
        this.labtestsList = response.rows
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
        labtestId: null,
        followupId: null,
        bloodTestDate: null,
        wbcCount: null,
        neutrophilCount: null,
        lymphocyteCount: null,
        eosinophilCount: null,
        neutrophilPercent: null,
        lymphocytePercent: null,
        eosinophilPercent: null,
        hemoglobin: null,
        rbcCount: null,
        plateletCount: null,
        cReactiveProtein: null,
        allergenComboTestDate: null,
        totalIge: null,
        dustMiteCombo: null,
        moldCombo: null,
        petDanderCombo: null,
        foodCombo: null,
        nutCombo: null,
        singleAllergenTestDate: null,
        houseDustMite: null,
        dustMite: null,
        pollen: null,
        weed: null,
        aspergillus: null,
        alternaria: null,
        cockroach: null,
        catDander: null,
        dogDander: null,
        eggWhite: null,
        milk: null,
        shrimp: null,
        crab: null,
        soybean: null,
        sesame: null,
        wheat: null,
        nuts: null,
        allergenOther: null,
        skinPrickTestDate: null,
        prickHouseDustMite: null,
        prickDustMite: null,
        sputumEosinophilTestDate: null,
        sputumEosinophilCount: null,
        totalIgeRepeatTestDate: null,
        totalIgeRepeatValue: null
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
      this.ids = selection.map(item => item.labtestId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加实验室检查"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const labtestId = row.labtestId || this.ids
      getLabtests(labtestId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改实验室检查"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.labtestId != null) {
            updateLabtests(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addLabtests(this.form).then(response => {
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
      const labtestIds = row.labtestId || this.ids
      this.$modal.confirm('是否确认删除实验室检查编号为"' + labtestIds + '"的数据项？').then(function() {
        return delLabtests(labtestIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('FollowSys/labtests/export', {
        ...this.queryParams
      }, `labtests_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
