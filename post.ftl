<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}">


<main class="self-container mdui-container">
  <div class="containerLeft">
    <article class="post">
      <div class="mdui-card">
        <#if post.thumbnail?? && post.thumbnail!=''>
          <div class="mdui-card-media">
            <div class="postBackground" style="background-image: url('${post.thumbnail!}')"></div>
            <div class="mdui-card-media-covered mdui-card-media-covered-gradient">
              <div class="mdui-card-primary">
                <div class="mdui-card-primary-title">${post.title!}</div>
              </div>
            </div>
          </div>
          <#else>
            <div class="noimg">
              <h2 class="mdui-card-primary-title">${post.title!}</h2>
            </div>
        </#if>

        <div class="postFront">
          <div class="pleft">
            <img class="mdui-img-circle" src="${blog_logo!}" alt="${user.nickname!}">
            <div>
              <span>${user.nickname!}</span>
              <span>${post.createTime?string["yyyy年MM月dd日"]!} 阅读:${post.visits!}</span>
            </div>
          </div>
          <div class="pright">
            <button class="copylink mdui-btn mdui-btn-icon mdui-ripple mdui-text-color-theme"><i
                class="mdui-icon material-icons">share</i></button>
          </div>
        </div>
        <div class="mdui-card-content js-toc-content">
          ${post.formatContent!}
        </div>
        <div class="pbottom mdui-card-primary-subtitle">
              <div>分类:
                <#if (post.categories)?? && post.categories?size !=0>
                    <#list post.categories as categorie>
                        <a href="${categorie.fullPath!}">${categorie.name!}</a>
                    </#list>
                <#else>
                    <span>无</span>
                </#if>
              </div>
              <div>标签:
                <#if (post.tags)?? && post.tags?size !=0>
                    <#list post.tags as tag>
                        <a href="${tag.fullPath!}">${tag.name!}</a>
                    </#list>
                <#else>
                    <span>无</span>
                </#if>
              </div>
        </div>
      </div>
    </article>
    <div class="nextPost">
        <#if prevPost??>
            <a href="${prevPost.fullPath!}">
              <button class="mdui-btn">
                上一篇
              </button>
            </a>
            <#else>
              <button class="mdui-btn">
                没有了
              </button>
        </#if>
        <#if nextPost??>
            <a href="${nextPost.fullPath!}">
              <button class="mdui-btn">
                下一篇
              </button>
            </a>
        <#else>
            <button class="mdui-btn">
              没有了
            </button>
        </#if>
            
        
    </div>
    <#--  评论区域  -->
        <#include "module/comment.ftl">
        <@comment post=post type="post" />
    <#--  评论区结束  -->
  </div>



  <div class="containerRight">
        <div class="sticky postSticky">
                        <div class="mdui-card">
              <div class="profile">
              <img class="mdui-img-circle mdui-shadow-2" src="${blog_logo!}" alt="">
              <div class="pcontact">
                <a href="${settings.github!}" target="_blank" class="mdui-btn mdui-btn-icon mdui-color-theme-100 mdui-text-color-theme">
                  <i class="mdui-icon icon-github"></i>
                </a>
                <a href="mailto:${settings.email!}" class="mdui-btn mdui-btn-icon mdui-color-theme-100 mdui-text-color-theme">
                  <i class="mdui-icon icon-mail"></i>
                </a>
              </div>
              <div class="profileinner mdui-color-theme-100 mdui-text-color-theme">
                <div>
                  <span>文章</span>
                  <@postTag method="count">
                  <span>${count!0}</span>
                  </@postTag>
                </div>
                <div>
                  <span>分类</span>
                  <@categoryTag method="count">
                  <span>${count!0}</span>
                  </@categoryTag>
                </div>
                <div>
                  <span>标签</span>
                  <@tagTag method="count">
                  <span>${count!0}</span>
                  </@tagTag>
                </div>
              </div>
              </div>
            </div>
             <div class="mdui-card">
              <div class="mdui-typo-title">目录</div>
                <div class="pindex">
                
                </div>
            </div>
            
        </div>
    </div>
</main>

<script>
  tocbot.init({
  // Where to render the table of contents.
  tocSelector: '.pindex',
  // Where to grab the headings to build the table of contents.
  contentSelector: '.js-toc-content',
  // Which headings to grab inside of the contentSelector element.
  headingSelector: 'h1, h2, h3, h4, h5, h6',
  // For headings inside relative or absolute positioned containers within content.
  hasInnerContainers: true,
});
</script>
</@layout>
