<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <title>程序安装</title>
    <style type="text/css">
        @media (prefers-color-scheme: dark) {
            .dark-scheme {
                background: black;
                color: #ddd;
            }
        }

        .el-header {
            background-color: #B3C0D1;
            color: #333;
            line-height: 60px;
        }

        .el-aside {
            color: #333;
        }
    </style>
</head>
<!-- class="dark-scheme" -->

<body>
    <div id="app">
        <span>US、魔盒 打包</span>
        <el-divider></el-divider>
        <el-tabs :tab-position="tabPosition" v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="US打包" name="us">
                <el-button type="success" @click="usClickDebug">一键下载US（Debug）</el-button><br><br>
                <el-button type="danger" @click="usClickRelease">一键下载US（Release）</el-button><br><br>
                <el-button type="danger" @click="usClickAdHoc">一键下载US（AdHoc）</el-button>
            </el-tab-pane>
            <el-tab-pane label="魔盒打包" name="mh">
                <el-button type="success" @click="mhClickDebug">一键下载魔盒（Debug）</el-button><br><br>
                <el-button type="danger" @click="mhClickRelease">一键下载魔盒（Release）</el-button><br><br>
                <el-button type="danger" @click="mhClickAdHoc">一键下载魔盒（AdHoc）</el-button>
            </el-tab-pane>
            <el-tab-pane label="web" name="web">
                <el-button type="success" @click="webmactest">一键下载mac（test）</el-button><br><br>
                <el-button type="success" @click="webmacprod">一键下载mac（prod）</el-button><br><br>    
                <el-button type="danger" @click="webwintest">一键下载win（test）</el-button><br><br>
                <el-button type="danger" @click="webwinprod">一键下载win（prod）</el-button><br><br>
            </el-tab-pane>
        </el-tabs>
    </div>

</body>

<script src="../public/vue.js"></script>

<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function () {
            return {
                app: 'us',
                activeName: 'us',
                tabPosition: 'left'
            }
        },
        methods: {
            webmactest(){
                // mac test
                var urlString = 'https://ios.lingdongcy.com/test/us.dmg'
                location.href = urlString;
            },
            webmacprod(){
                // mac prod
                var urlString = 'https://ios.lingdongcy.com/release/us.dmg'
                location.href = urlString;
            },
            webwintest(){
                // win test
                var urlString = 'https://ios.lingdongcy.com/test/us.exe'
                location.href = urlString;
            },
            webwinprod(){
                // win prod
                var urlString = 'https://ios.lingdongcy.com/release/us.exe'
                location.href = urlString;
            },
            handleClick(tab, event) {
                console.log(tab, event);
            },
            usClickDebug: function () {
                
                this.$message({
                    message: 'Us-Debug，将要安装',
                    type: 'success'
                });
                this.openUrl('test','debug.plist')
            },
            usClickRelease: function () {
                
                this.$message({
                    message: 'Us-Release，将要安装',
                    type: 'success'
                });
                this.openUrl('release','release.plist')
            },
            usClickAdHoc:function (){
                this.$message({
                    message: 'Us-AdHoc，将要安装',
                    type: 'success'
                });
                this.openUrl('adhoc','adhoc.plist')
            },
            mhClickDebug: function () {

                this.$message({
                    message: '魔盒Debug，将要安装',
                    type: 'success'
                });
                this.openUrl('test','mhdebug.plist')
            },
            mhClickRelease: function () {
                this.$message({
                    message: '魔盒Release，将要安装',
                    type: 'success'
                });
                this.openUrl('release','mhrelease.plist')
            },
            mhClickAdHoc:function(){
                this.$message({
                    message: '魔盒AdHoc，将要安装',
                    type: 'success'
                });
                this.openUrl('AdHoc','mhAdHoc.plist')
            },
            successAlert: function (title, content) {
                this.$notify({
                    title: title,
                    message: content,
                    type: 'success'
                });
                
            },
            openUrl: function (configuration, plistName) {
                var urlString = 'itms-services://?action=download-manifest&url=https://ios.lingdongcy.com/' + configuration + '/' + plistName;
                location.href = urlString;
            }
        }
    })
</script>

</html>