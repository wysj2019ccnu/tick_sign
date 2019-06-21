//app.js
App({
  /**
   * 当小程序初始化完成时，会触发 onLaunch（全局只触发一次）
   */
  onLaunch: function () {
    let that = this
    //获取openid并写入数据库
    wx.login({
      success: function (res) {
        //console.log(res.code)
        //发送请求
        wx.request({
          url: 'http://www.tickey.xyz/tick_php/openid_get.php',
          //接口地址
          data: {
            code: res.code,
          },
          method: 'POST',
          header: {
            'content-type': 'application/x-www-form-urlencoded' // 默认值
          },
          success: function (res) {
            that.globalData.openid = res.data
            console.log(that.globalData.openid)
          }
        })
      }
    }) 
    wx.getUserInfo({
      success: function (res) {
        var userInfo = res.userInfo
        var nickName = userInfo.nickName
        var avatarUrl = userInfo.avatarUrl
        that.globalData.nickName = nickName
        that.globalData.avatarUrl = avatarUrl  
        //console.log(that.globalData.nickName) 
      }
    })
  },

  /**
   * 当小程序发生脚本错误，或者 api 调用失败时，会触发 onError 并带上错误信息
   */
  onError: function (msg) {
  },

  globalData: {
    openid : "",
    nickName:"",
    avatarUrl:""
  },
})