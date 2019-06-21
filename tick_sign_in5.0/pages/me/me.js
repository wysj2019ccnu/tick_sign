const app = getApp()

Page({
  data: {
    nickname: '',
    avatar: ''
  },
  onLoad:function(){
    var that=this
    that.setData({
      nickname: app.globalData.nickName,
      avatar: app.globalData.avatarUrl
    })
  },
  jump1: function () {
    wx.navigateTo({
      url: '/pages/event_list/event_list',
    })
  },
  jump2: function (event) {
    wx.navigateTo({
      url: '/pages/join_list/join_list',
    })
  },
  jump3: function () {
    wx.navigateTo({
      url: '/pages/instruct/instruct',
    })
  },
  jump4: function () {
    wx.navigateTo({
      url: '/pages/connectus/connectus',
    })

  },


})