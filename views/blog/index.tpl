<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="Minho" />
    <meta name="site" content="https://www.iminho.me" />
    <meta name="keywords" content="{{.Model.BlogTitle}}">
    <meta name="description" content="{{.Model.BlogTitle}}-{{.Description}}">
    <title>{{.Model.BlogTitle}} - Powered by MinDoc</title>

    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main-modern-ui.css" "version"}}" rel="stylesheet">
    <style type="text/css">
        .footer{
            margin-top: 0;
        }
    </style>
</head>
<body>
<div class="manual-reader manual-container manual-search-reader">
{{template "widgets/header.tpl" .}}

    <!-- Blog Detail Hero Section -->
    <div class="blog-detail-hero-section">
        <div class="container">
            <div class="blog-detail-hero-content">
                <h1 class="blog-detail-title">{{.Model.BlogTitle}}</h1>
                <div class="blog-detail-meta">
                    <span class="blog-meta-item">
                        <img src="{{cdnimg .Model.MemberAvatar}}" alt="{{.Model.CreateName}}" class="blog-author-avatar">
                        <span class="blog-author-name">{{.Model.CreateName}}</span>
                    </span>
                    <span class="blog-meta-item">
                        <i class="fa fa-calendar-o"></i>
                        {{i18n .Lang "blog.posted_on"}} {{date_format .Model.Created "2006-01-02 15:04:05"}}
                    </span>

                    <span class="blog-meta-item">
                        <i class="fa fa-pencil-square-o"></i>
                        {{.Model.ModifyRealName}} {{i18n .Lang "blog.modified_on"}} {{date_format .Model.Modified "2006-01-02 15:04:05"}}
                    </span>

                    {{if eq .Member.MemberId .Model.MemberId}}
                    <span class="blog-meta-item blog-edit-item">
                        <a href='{{urlfor "BlogController.ManageEdit" ":id" .Model.BlogId}}' title="{{i18n .Lang "blog.edit_blog"}}">
                            <i class="fa fa-edit"></i> {{i18n .Lang "common.edit"}}
                        </a>
                    </span>
                    {{end}}
                </div>
            </div>
        </div>
    </div>

    <div class="container manual-body">
        <div class="row">
            <div class="article-body markdown-body editormd-preview-container content modern-article-body">
                {{.Content}}
                {{if .Model.AttachList}}
                <div class="modern-attach-list">
                    <div class="attach-header">
                        <i class="fa fa-paperclip"></i>
                        <strong>{{i18n .Lang "doc.attachment"}}</strong>
                    </div>
                    <ul class="attach-items">
                    {{range $index,$item := .Model.AttachList}}
                    <li class="attach-item">
                        <i class="fa fa-file-o"></i>
                        <a href="{{$item.HttpPath}}" title="{{$item.FileName}}">{{$item.FileName}}</a>
                    </li>
                    {{end}}
                    </ul>
                </div>
                {{end}}
            </div>
        </div>
        <div class="row modern-blog-footer">
            <div class="blog-nav-item">
                <span class="blog-nav-label"><i class="fa fa-angle-left"></i> {{i18n .Lang "blog.prev"}}</span>
                {{if .Previous}}
                <a href="{{urlfor "BlogController.Index" ":id" .Previous.BlogId}}" title="{{.Previous.BlogTitle}}" class="blog-nav-link">{{.Previous.BlogTitle}}</a>
                {{else}}
                <span class="blog-nav-none">{{i18n .Lang "blog.no"}}</span>
                {{end}}
            </div>
            <div class="blog-nav-item blog-nav-next">
                <span class="blog-nav-label">{{i18n .Lang "blog.next"}} <i class="fa fa-angle-right"></i></span>
                {{if .Next}}
                <a href="{{urlfor "BlogController.Index" ":id" .Next.BlogId}}" title="{{.Next.BlogTitle}}" class="blog-nav-link">{{.Next.BlogTitle}}</a>
                {{else}}
                <span class="blog-nav-none">{{i18n .Lang "blog.no"}}</span>
                {{end}}
            </div>
        </div>
    </div>
{{template "widgets/footer.tpl" .}}
    </div>
</div>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}"></script>
{{.Scripts}}
</body>
</html>