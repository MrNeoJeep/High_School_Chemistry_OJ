(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-20b2ca94"],{"5fbe":function(e,t,n){e.exports=n.p+"static/img/logo2.62af8c14.png"},"7b25":function(e,t,n){"use strict";n("dbc0")},"9a2b":function(e,t,n){"use strict";n("ea02")},d5c2:function(e,t,n){"use strict";n.r(t);var s=function(){var e=this,t=e._self._c;return t("div",{staticClass:"lowin lowin-blue"},[e._m(0),t("div",{staticClass:"lowin-wrapper"},[t("div",{staticClass:"lowin-box lowin-register"},[t("div",{staticClass:"lowin-box-inner"},[t("el-form",{ref:"loginForm",attrs:{model:e.loginForm}},[t("p",[e._v("高中化学考试系统")]),t("div",{staticClass:"lowin-group"},[t("label",[e._v("用户名 ")]),t("el-input",{ref:"userName",staticClass:"lowin-input",attrs:{placeholder:"用户名",name:"userName",type:"text",tabindex:"1","auto-complete":"on"},model:{value:e.loginForm.userName,callback:function(t){e.$set(e.loginForm,"userName",t)},expression:"loginForm.userName"}})],1),t("div",{staticClass:"lowin-group password-group"},[t("label",[e._v("密码")]),t("el-input",{ref:"password",staticClass:"lowin-input",attrs:{placeholder:"密码",name:"password",tabindex:"2","auto-complete":"on"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.handleLogin.apply(null,arguments)}},model:{value:e.loginForm.password,callback:function(t){e.$set(e.loginForm,"password",t)},expression:"loginForm.password"}})],1),t("div",{staticClass:"lowin-group"},[t("label",[e._v("年级 ")]),t("el-select",{staticClass:"lowin-input",attrs:{placeholder:"年级"},model:{value:e.loginForm.userLevel,callback:function(t){e.$set(e.loginForm,"userLevel",t)},expression:"loginForm.userLevel"}},e._l(e.levelEnum,(function(e){return t("el-option",{key:e.key,attrs:{value:e.key,label:e.value}})})),1)],1),t("el-button",{staticClass:"lowin-btn login-btn",attrs:{type:"text"},nativeOn:{click:function(t){return t.preventDefault(),e.handleRegister.apply(null,arguments)}}},[e._v("注册")]),t("div",{staticClass:"text-foot"},[e._v(" 已有账号? "),t("router-link",{staticClass:"login-link",attrs:{to:"/login"}},[e._v(" 登录 ")])],1)],1)],1)])]),e._m(1)])},o=[function(){var e=this,t=e._self._c;return t("div",{staticClass:"lowin-brand"},[t("img",{staticStyle:{"margin-top":"12px"},attrs:{src:n("5fbe"),alt:"logo"}})])},function(){var e=this,t=e._self._c;return t("div",{staticClass:"account-foot-copyright"},[t("span",[e._v("Copyright ©2022 未来教育有限公司 苏州科技大学")])])}],l=n("5530"),i=(n("14d9"),n("2f62")),a=n("b775"),r={register:function(e){return Object(a["b"])("/api/student/user/register",e)}},u={name:"Login",data:function(){return{loginForm:{userName:"",password:"",userLevel:1}}},methods:Object(l["a"])({handleRegister:function(){var e=this;r.register(this.loginForm).then((function(t){t&&1===t.code?e.$router.push({path:"/login"}):e.$message.error(t.message)}))}},Object(i["d"])("user",["setUserName"])),computed:Object(l["a"])({},Object(i["e"])("enumItem",{levelEnum:function(e){return e.user.levelEnum}}))},c=u,p=(n("9a2b"),n("7b25"),n("2877")),d=Object(p["a"])(c,s,o,!1,null,"d458ab2e",null);t["default"]=d.exports},dbc0:function(e,t,n){},ea02:function(e,t,n){}}]);