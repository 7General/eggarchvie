'use strict';


const Service = require('egg').Service;
const exec = require('child_process').exec;

class ProgressService extends Service {

  async serviceiOS(appName, ref, configuration, desc, update) {
    /**
     * 配置参数
     * ref：分支名称
     * RUN_CONFIGATION_BUILD ：打包环境DEBUG/RELEASE/AdHoc
     * RUN_CONFIGATION_BUILD_DESC:打包描述，必填
     * RUN_CONFIGATION_BUILD_UPDATE：是否更新pod
     * RUN_CONFIGATION_BRANCH:打包分支名称
     */
    console.log('appname', appName);
    if (appName.length === 0) {
      appName = 'us';
    }
    let archiveCMD = '';
    if (appName === 'us') {
      archiveCMD = 'curl -X POST -F token=719d1ef832ffc37120a028850ceb07 -F "ref=' + ref +
        '" -F "variables[RUN_CONFIGATION_BUILD]=' + configuration +
        '" -F "variables[RUN_CONFIGATION_BUILD_DESC]=' + desc +
        '" -F "variables[RUN_CONFIGATION_BUILD_UPDATE]=' + update +
        '" -F "variables[RUN_CONFIGATION_BRANCH]=' + ref +
        '" https://gitlab.ldcy.lingdongcy.com/api/v4/projects/10/trigger/pipeline';
    } else if (appName === 'mh') {
      console.log('mh+++>' + appName);
      archiveCMD = 'curl -X POST -F token=55ae9453cc4dd278400e961f6e187b -F "ref=' + ref +
        '" -F "variables[RUN_CONFIGATION_BUILD]=' + configuration +
        '" -F "variables[RUN_CONFIGATION_BUILD_DESC]=' + desc +
        '" -F "variables[RUN_CONFIGATION_BUILD_UPDATE]=' + update +
        '" -F "variables[RUN_CONFIGATION_BRANCH]=' + ref +
        '" http://8.142.109.121/api/v4/projects/58/trigger/pipeline';
    } else if (appName === 'ntf') {
      console.log('mh+++>' + appName);
      archiveCMD = 'curl -X POST -F token=141c3767f22d16a8f84ad15ae63902 -F "ref=' + ref +
        '" -F "variables[RUN_CONFIGATION_BUILD]=' + configuration +
        '" -F "variables[RUN_CONFIGATION_BUILD_DESC]=' + desc +
        '" -F "variables[RUN_CONFIGATION_BUILD_UPDATE]=' + update +
        '" -F "variables[RUN_CONFIGATION_BRANCH]=' + ref +
        '" https://gitlab.ldcy.lingdongcy.com/api/v4/projects/69/trigger/pipeline';
    }
    console.log('=========================================');
    console.log('archiveCMD:' + archiveCMD);
    console.log('=========================================');
    exec(archiveCMD, function(err, stdout, stderr) {
      if (err) {
        const msg = 'api error:' + stderr;
        console.log(msg);
      } else {
        const data = JSON.parse(stdout);
        console.log(data);
      }
    });
    return {
      status: 200,
      data: '异步调用',
    };
  }

  async serviceWEB(ref, configuration, desc, platform) {
    /**
     * 配置参数
     * ref：分支名称
     * RUN_CONFIGATION_BUILD ：打包环境DEBUG/RELEASE/AdHoc
     * RUN_CONFIGATION_BUILD_DESC:打包描述，必填
     * RUN_CONFIGATION_BUILD_UPDATE：是否更新pod
     * RUN_CONFIGATION_BRANCH:打包分支名称
     * RUN_CONFIGATION_PLATFORM:打包输出平台
     */
    const archiveCMD = 'curl -X POST -F token=1f99b7aea656ea79e9fbf765530bb9 -F "ref=' + ref +
        '" -F "variables[RUN_CONFIGATION_BUILD]=' + configuration +
        '" -F "variables[RUN_CONFIGATION_BUILD_DESC]=' + desc +
        '" -F "variables[RUN_CONFIGATION_PLATFORM]=' + platform +
        '" -F "variables[RUN_CONFIGATION_BRANCH]=' + ref +
        '" https://gitlab.ldcy.lingdongcy.com/api/v4/projects/71/trigger/pipeline';

    console.log('=========================================');
    console.log('archiveCMD:' + archiveCMD);
    console.log('=========================================');

    exec(archiveCMD, function(err, stdout, stderr) {
      if (err) {
        const msg = 'api error:' + stderr;
        console.log(msg);
      } else {
        const data = JSON.parse(stdout);
        console.log(data);
      }
    });
    return {
      status: 200,
      data: '异步调用',
    };
  }
}
module.exports = ProgressService;

