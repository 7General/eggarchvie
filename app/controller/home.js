'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    const dataList = {
      list: [
        { id: 1, title: 'this is news 1', url: '/news/1' },
        { id: 2, title: 'this is news 2', url: '/news/2' },
      ],
      wang: '构建web',
    };
    await ctx.render('index.tpl', dataList);
  }

  async archiveiOS() {
    const ctx = this.ctx;

    const appName = ctx.request.body.appName;
    const ref = ctx.request.body.ref;
    const configuration = ctx.request.body.config;
    const desc = ctx.request.body.desc;
    const update = ctx.request.body.update;

    const res = await ctx.service.progress.serviceiOS(appName, ref, configuration, desc, update);
    ctx.status = 200;
    ctx.body = res;
  }
  async archiveWEB() {
    const ctx = this.ctx;

    const ref = ctx.request.body.ref;
    const configuration = ctx.request.body.config;
    const desc = ctx.request.body.desc;
    const platform = ctx.request.body.platform;

    const res = await ctx.service.progress.serviceWEB(ref, configuration, desc, platform);
    ctx.status = 200;
    ctx.body = res;
  }
}

module.exports = HomeController;
