from django.conf.urls import patterns, include, url
from django.conf import settings
from django.contrib import admin


admin.autodiscover()
#make sure that any view/model/form imports occur AFTER admin.autodiscover


from mainsite.views import HomeView, Error404, Error500


urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', HomeView.as_view(), name='home'),

    # Test URLs to allow you to see these pages while DEBUG is True
    url(r'^error/404/$', Error404.as_view(), name='404'),
    url(r'^error/500/$', Error500.as_view(), name='500'),
)


if getattr(settings, 'DEBUG_MEDIA', True):
    media_url = getattr(settings, 'MEDIA_URL', '/media/')
    if media_url[0] == '/':
        media_url = media_url[1:]
    urlpatterns = patterns('',
        url(r'^%s(?P<path>.*)$' % (media_url,), 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT
        }),
    ) + urlpatterns
