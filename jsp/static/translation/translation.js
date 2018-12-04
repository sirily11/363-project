var languageCode = navigator.language.substr(0, 2);
if(!languageCode.includes('zh')){
    languageCode = 'en';
}
const content = {
    "en": {
       "videoSection" : "Video Section",
        "school" : "School"
    },

    "zh": {
      "videoSection" : "视频",
        "school" : "学校",
        "trip" : "旅行",
        "projects" : "项目",
        "lyricsTranslator" : "歌词翻译网站",
        "dotaScore" : "Dota2 战绩网站",
        "worldcupPrediction" : "世界杯预测",
        "HealthTracker" : "健康追踪",
        "imageTransform" : "照片风格化",
        "timeApp" : "时间App",
        "docSection" : "文档",
        "blog" : "博客",
        "homeTitle" : "Sirilee 的个人主页",
        "homeDescription" : "在这里我会展示我的许多个人项目以及我的视频成品。平时也会有一些我写的博客在此展示。",
        "aboutme" : "关于我",
        "cardVideoTitle" : "视频",
        "cardVideoDescription" : "我喜欢拍摄视频，也喜欢旅游。转过了日本、美国、韩国以及中国大部分省市。看过了世界各地的风土人情自然也有许多名胜古迹。" +
            "但是对于我来说，旅游绝对不仅仅是用眼睛去看，还有就是用手中的相机去拍，去记录。让这份回忆永远的被记录下来。",
        "cardProjectTitle" : "项目",
        "cardProjectDescription" : "项目部分内容",
        "cardDocTitle" : "文档",
        "cardDocDescription" : "文档部分内容"

    }
};
$(".lang").each(function (index) {
    var id = this.id;
    console.log(id);
    $(this).append(content[languageCode][id]);
});
