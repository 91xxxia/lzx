<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>过敏性疾病专病库</h2>
        <p>
          本专病库管理系统基于rouyi框架开发，包含临床数据库、生物样本库、流调数据库、随访数据库。首次整合临床、环境、肠道菌群、基因组等数据，构建过敏性疾病
          全生命周期数据链。采用国际通用标准，支持未来向其他疾病数据库扩展，推动数据向新药研发、健康管理产品转化。
          多学科诊疗如何应用于疑难疾病的诊断与治疗已然成为近年来医学界讨论的热点之一，将多学科诊疗应用于过敏性疾病的诊疗，对于提升医院整体临床诊疗水平、改善患儿
          生活质量具有重要意义。因此，在信息化、互联网、人工智能等新技术的帮助下，多学科诊疗这一新型临床诊疗模式便成为提升过敏性疾病诊疗水平的重要突破点之一。
        </p>
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>技术选型</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>Spring Security</li>
              <li>JWT</li>
              <li>MyBatis</li>
              <li>Druid</li>
              <li>Fastjson</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Sass</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>小组成员</span>
          </div>
          <div class="body">
            <p>
              <div><i class="el-icon-user-solid"></i> 102300425_郭育铭</div>
              <div><i class="el-icon-user-solid"></i> 102300428_何振坤</div>
              <div><i class="el-icon-user-solid"></i> 102300429_林哲兴</div>
              <div><i class="el-icon-user-solid"></i> 102300430_胡喆昶</div>
            </p>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>开发日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v1.1.0 - 2025-06-29">
              <ol>
                <li><strong>前端体验优化：</strong>全面调整UI（间距/配色/字体）</li>
                <li><strong>交互增强：</strong>统一提示组件、按钮加载状态</li>
                <li><strong>表单优化：</strong>动态校验规则、字典数据绑定</li>
                <li><strong>响应式调整：</strong>确保多端兼容性</li>
                <li><strong>后端优化：</strong>关键操作日志记录、慢查询优化</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.0.0 - 2025-06-29">
              <ol>
                <li><strong>基础框架：</strong>基于若依前后端分离版搭建</li>
                <li><strong>核心功能：</strong>实现临床/样本/流调数据CRUD</li>
                <li><strong>权限系统：</strong>RBAC角色控制（管理员/普通用户）</li>
                <li><strong>数据库：</strong>完成设计与初始化脚本</li>
                <li><strong>联调测试：</strong>前后端基础功能联调</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="2025-06-26 测试与Bug修复">
              <ol>
                <li>制定测试用例覆盖核心功能</li>
                <li>交叉测试发现并修复关键Bug</li>
                <li>优化数据删除后列表刷新逻辑</li>
                <li>修复必填字段前端校验问题</li>
                <li>解决分页查询参数传递错误</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="2025-06-20 功能迭代与联调">
              <ol>
                <li>后端深化：实现业务逻辑与数据校验</li>
                <li>前端优化：页面美化与布局调整</li>
                <li>接口开发：多条件查询与数据导出</li>
                <li>前后端联调解决字段映射问题</li>
                <li>权限控制配置与测试</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="2025-06-11 框架初始化">
              <ol>
                <li>下载若依前后端分离框架</li>
                <li>配置本地开发环境</li>
                <li>使用代码生成器创建核心模块</li>
                <li>后端整合与配置调整</li>
                <li>前端路由配置与页面整合</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="2025-06-09 数据库设计">
              <ol>
                <li>编写SQL DDL建表脚本</li>
                <li>设计跨库关联与约束</li>
                <li>插入基础测试数据</li>
                <li>压力测试外键约束</li>
                <li>整合数据库初始化脚本</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="2025-06-04 需求分析">
              <ol>
                <li>明确核心功能范围</li>
                <li>绘制E-R图（临床/样本/流调数据关系）</li>
                <li>设计权限系统（RBAC模型）</li>
                <li>确定"必须功能"与"后期优化"功能</li>
                <li>创建核心功能清单文档</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.9.0"
    }
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank")
    }
  }
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;

      li {
        margin-bottom: 8px;
        line-height: 1.6;
      }
    }

    .el-collapse-item__header {
      font-weight: bold;
    }
  }
}
</style>
