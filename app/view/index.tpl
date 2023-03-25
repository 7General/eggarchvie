<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>
    <div id="app">
        <el-tabs v-model="activeName">
            <el-tab-pane label="iOS打包管理" name="ios">
                
                <el-form ref="form" :model="form" label-width="120px">
                    <el-form-item label="选择app">
                        <el-radio v-model="form.app" label="us" border @change="appClick">us</el-radio>
                        <el-radio v-model="form.app" label="mh" border @change="appClick">魔盒</el-radio>
                        <el-radio v-model="form.app" label="ntf" border @change="appClick">NTF</el-radio>
                    </el-form-item>
                    <el-form-item label="分支名称">
                        <el-input v-model="form.refName" placeholder="请输入分支名称"></el-input>
                    </el-form-item>

                    <el-form-item label="构建环境">
                        <el-radio-group v-model="form.config" @change="radioClick">
                            <el-radio-button label="Debug"></el-radio-button>
                            <el-radio-button label="Release"></el-radio-button>
                            <el-radio-button label="AdHoc"></el-radio-button>
                            <el-radio-button label="app-store"></el-radio-button>
                            </el-checkbox-group>
                    </el-form-item>

                    <el-form-item label="打包描述">
                        <el-input v-model="form.desc" type="textarea" placeholder="务必添加打包描述，否则将不会触发构建"></el-input>
                    </el-form-item>
                    <el-form-item label="是否更新pod">
                        <el-switch
                            v-model="form.update"
                            active-color="#13ce66"
                            inactive-color="#ff4949"
                            @change="switchClick">
                        </el-switch>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="archiveClick">构建</el-button>
                    </el-form-item>
                </el-form>
                <el-divider>iOS构建</el-divider>
            </el-tab-pane>
            <el-tab-pane label="web打包管理" name="web">
                <el-form ref="webForm" :model="webForm" label-width="120px">
                    <el-form-item label="分支名称">
                        <el-input v-model="webForm.refName" placeholder="请输入分支名称"></el-input>
                    </el-form-item>
                    <el-form-item label="构建环境">
                        <el-radio-group v-model="webForm.config" @change="webRadioClick">
                            <el-radio-button label="test"></el-radio-button>
                            <el-radio-button label="prod"></el-radio-button>
                        </el-checkbox-group>
                    </el-form-item>
                    <el-form-item label="构建输入平台">
                        <el-checkbox-group v-model="webForm.printPlatform" @change="platformClick">
                            <el-checkbox label="win" border></el-checkbox>
                            <el-checkbox label="mac" border></el-checkbox>
                        </el-checkbox-group>
                    </el-form-item>
                    <el-form-item label="打包描述">
                        <el-input v-model="webForm.desc" type="textarea" placeholder="务必添加打包描述，否则将不会触发构建"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="webArchiveClick">构建</el-button>
                    </el-form-item>
                </el-form>
                <el-divider>web构建</el-divider>
            </el-tab-pane>
        </el-tabs>
        <ul class="news-view view">
            <el-button type="danger">构建时务必添加打包描述，否则将不会触发构建</el-button>
            <!-- {% for item in list %}
              <li class="item">
                <a href="{{ item.url }}">{{ item.title }}</a>
              </li>
            {% endfor %} -->
          </ul>
    </div>
    
    
    
</body>
<script src="../public/vue.js"></script>

<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>

    new Vue({
        el: '#app',
        data: function () {
            return {
                activeName:'ios',
                form: {
                    refName: '',
                    config: 'Debug',
                    desc: '',
                    update: false,
                    app: 'us'
                },
                webForm:{ // web构建项目
                    refName: '', // 分支名
                    config: 'test',
                    printPlatform:['mac','win'],
                    desc: '', //打包描述
                    app: 'web'
                }
            }
        },
        methods: {
            appClick:function (){
                let appname = this.form.app === 'us' ? "us" : "探宝魔盒";
                this.$message({
                    message: '选择了app为：'+ appname,
                    type: 'success'
                });
            },
            archiveClick: function () {
                // const selfs = this;
                // // 开始校验
                // if (this.form.refName === "") {
                //     this.$message({
                //         message: '输入分支名称！！！',
                //         type: 'warning'
                //     });
                //     return;
                // }
                // if (this.form.desc === "") {
                //     this.$message({
                //         message: '输入打包描述，否则将无法构建！！！',
                //         type: 'warning'
                //     });
                //     return;
                // }


                // axios.post('/ios', {
                //     appName:this.form.app,
                //     ref: this.form.refName,
                //     config: this.form.config,
                //     desc: this.form.desc,
                //     update:this.form.update
                // }).then(function (response) {
                //     if (response.status == 200) {
                //         selfs.successAlert('succss', '触发构建成功')
                //     } else {
                //         selfs.warningAlert('warning', '触发构建失败')
                //     }
                // }).catch(function (error) {
                //     console.log("2>>" + JSON.stringify(error));
                // });
                axios.post('/chat',{
                    question:'hellow'
                }).then(res=>{
                    console.log("========================res");
                },err=>{
                    console.log("========================err");
                })
            },
            radioClick: function () {
                this.$notify({
                    title: '选择环境',
                    message: this.form.config,
                    type: 'success'
                });
            },
            switchClick: function (){
                this.$notify({
                    title: '是否更新pod',
                    message: this.form.update,
                    type: 'success'
                });
            },
            warningAlert: function (title, content) {
                this.$notify({
                    title: title,
                    message: content,
                    type: 'warning'
                });
            },
            successAlert: function (title, content) {
                this.$notify({
                    title: title,
                    message: content,
                    type: 'success'
                });
            },
            // web
            webArchiveClick(){
                const selfs = this;
                // 开始校验分支名称
                if (this.webForm.refName === "") {
                    this.$message({
                        message: '输入分支名称！！！',
                        type: 'warning'
                    });
                    return;
                }
                // 校验输入平台
                if(this.webForm.printPlatform.length == 0){
                    this.$message({
                        message: '需要选择构建输出平台',
                        type: 'warning'
                    });
                    return;
                }
                // 校验打包描述
                if (this.webForm.desc === "") {
                    this.$message({
                        message: '输入打包描述，否则将无法构建！！！',
                        type: 'warning'
                    });
                    return;
                }
                axios.post('/web', {
                    appName:this.webForm.app,
                    ref: this.webForm.refName,
                    config: this.webForm.config,
                    platform:this.webForm.printPlatform,
                    desc: this.webForm.desc
                }).then(function (response) {
                    if (response.status == 200) {
                        selfs.successAlert('succss', '触发web构建成功')
                    } else {
                        selfs.warningAlert('warning', '触发web构建失败')
                    }
                }).catch(function (error) {
                    console.log("2>>" + JSON.stringify(error));
                });

            },
            webRadioClick(){
                this.$notify({
                    title: '选择环境',
                    message: this.webForm.config,
                    type: 'success'
                });
            },
            platformClick(value){
                console.log(value)
                
            }
            /*
            yarn build:mw:test
            yarn build:mw

            yarn build:mac:test
            yarn build:mac

            yarn build:win:test
            yarn build:win
            
            
            
            */

        }
    })
</script>

</html>