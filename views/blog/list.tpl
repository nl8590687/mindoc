<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{i18n .Lang "blog.blog_list"}} - Powered by MinDoc</title>
    <meta name="keywords" content="MinDoc,文档在线管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理">
    <meta name="description" content="MinDoc文档在线管理系统 {{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main-modern-ui.css" "version"}}" rel="stylesheet">

    <style type="text/css">
        .footer{margin-top: 0;}
        .label {
            background-color: #00b5ad!important;
            border-color: #00b5ad!important;
            color: #fff!important;
            font-weight: 400;
        }
        </style>
</head>
<body>
<div class="manual-reader manual-container manual-search-reader">
{{template "widgets/header.tpl" .}}

    <div class="container manual-body">
        <div class="row">
            <div class="manual-list modern-blog-list">
            {{range $index,$item := .Lists}}
                <div class="modern-blog-item">
                    <div class="blog-item-wrapper">
                        <div class="blog-item-header">
                            {{if eq $item.BlogStatus "password"}}<span class="label modern-label"><i class="fa fa-lock"></i> {{i18n $.Lang "blog.encrypt"}}</span>{{end}}
                            <a href="{{urlfor "BlogController.Index" ":id" $item.BlogId}}" title="{{$item.BlogTitle}}" class="blog-title">{{$item.BlogTitle}}</a>
                        </div>
                        <div class="blog-description">
                            {{$item.BlogExcerpt}}
                        </div>
                        <div class="blog-source">
                            <span class="blog-meta-item">
                                <i class="fa fa-user-circle-o"></i>
                                {{i18n $.Lang "blog.author"}}：{{$item.CreateName}}
                            </span>
                            <span class="blog-meta-item">
                                <i class="fa fa-clock-o"></i>
                                {{i18n $.Lang "blog.update_time"}}：{{date_format  $item.Modified "2006-01-02 15:04:05"}}
                            </span>
                        </div>
                    </div>
                </div>
            {{else}}
                <div class="blog-empty-state">
                    <i class="fa fa-file-text-o empty-icon"></i>
                    <p class="empty-text">{{i18n $.Lang "blog.no_blog"}}</p>
                </div>
            {{end}}
                <nav class="pagination-container modern-pagination">
                {{.PageHtml}}
                </nav>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
{{template "widgets/footer.tpl" .}}
</div>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}"></script>
{{.Scripts}}
</body>
</html>