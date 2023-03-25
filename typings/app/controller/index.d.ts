// This file is created by egg-ts-helper@1.29.1
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportChatGPT = require('../../../app/controller/chatGPT');
import ExportDownload = require('../../../app/controller/download');
import ExportHome = require('../../../app/controller/home');

declare module 'egg' {
  interface IController {
    chatGPT: ExportChatGPT;
    download: ExportDownload;
    home: ExportHome;
  }
}
