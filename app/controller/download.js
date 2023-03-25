'use strict';

const Controller = require('egg').Controller;

class DownloadController extends Controller {
  async index() {
    const { ctx } = this;
    const dataList = {
      list: [
        { id: 1, title: 'this is news 1', url: '/news/1' },
        { id: 2, title: 'this is news 2', url: '/news/2' },
      ],
      wang: '构建web',
    };
    await ctx.render('download.tpl', dataList);
  }

  async jsonData() {
    const { ctx } = this;
    const dataList = {
      list: [
        {
          createdAt: 1605289991294,
          updatedAt: 1671169950669,
          id: '5faec8071f33ba6a48811455',
          poster: 'https://wmdb.querydata.org/movie/poster/1605289989906-g7f33g.jpg',
          name: '教父1',
          genre: '剧情/犯罪',
          description: '迈克尔（阿尔·帕西诺 饰）是美利坚黑手党科利昂家族的头目。 迈克尔的父亲维托·安多里尼（罗伯特·德尼罗 饰）出生于意大利科利昂镇。1901年，维托的父亲安东尼奥、兄长保罗、母亲（玛丽亚·卡塔 饰）都死...',
          language: '英语,意大利语,西班牙语,拉丁语,西西里语',
          country: '美国',
          lang: 'Cn',
          shareImage: 'https://wmdb.querydata.org/movie/poster/1671169950666-5faec8031f33ba6a48811427.png',
          movie: '5faec8031f33ba6a48811427',
        },
        {
          createdAt: 1605289991294,
          updatedAt: 1671169950669,
          id: '5faec8071f33ba6a48811455',
          poster: 'https://wmdb.querydata.org/movie/poster/1605289989906-g7f33g.jpg',
          name: '教父2',
          genre: '剧情/犯罪',
          description: '迈克尔（阿尔·帕西诺 饰）是美利坚黑手党科利昂家族的头目。 迈克尔的父亲维托·安多里尼（罗伯特·德尼罗 饰）出生于意大利科利昂镇。1901年，维托的父亲安东尼奥、兄长保罗、母亲（玛丽亚·卡塔 饰）都死...',
          language: '英语,意大利语,西班牙语,拉丁语,西西里语',
          country: '美国',
          lang: 'Cn',
          shareImage: 'https://wmdb.querydata.org/movie/poster/1671169950666-5faec8031f33ba6a48811427.png',
          movie: '5faec8031f33ba6a48811427',
        },
      ],
      wang: '构建web',
    };
    ctx.status = 200;
    ctx.body = dataList;
  }
}

module.exports = DownloadController;
