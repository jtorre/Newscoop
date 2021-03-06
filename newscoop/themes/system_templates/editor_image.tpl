{{ dynamic }}
	{{ if $imageDetails['align'] }} <div align="center"> {{ /if }}
		<div class="cs_img {{ if $imageDetails['align'] }}cs_fl_{{ $imageDetails['align'] }}{{ /if }}" style="{{ if $imageDetails['width'] }}width:{{ $imageDetails['width'] }};{{ /if }}">
			{{ if strlen($imgZoomLink) > 0 }} <p><a href="{{ $imgZoomLink }}" class="photoViewer" title="{{ $imageDetails['sub'] }}"> {{ else }}<p> {{ /if }}
				<img src="{{ $uri->uri }}" {{ if isset($imageDetails['alt']) }}alt="{{ $imageDetails['alt'] }}"{{ /if }} {{ if isset($imageDetails['sub']) }}title="{{ $imageDetails['alt'] }}" {{ /if }} border="0"/>
			{{ if strlen($imgZoomLink) > 0 }} </a></p> {{ else }}</p> {{ /if }}
			{{ if isset($imageDetails['sub']) }}
                {{ if $MediaRichTextCaptions == 'Y' }}
                    <div class="cs_img_caption">{{$imageDetails['sub']}}</div>
                {{ else }}
                    <p class="cs_img_caption">{{$imageDetails['sub']}}</p>
                {{ /if }}
            {{ /if }}
		</div>
	{{ if $imageDetails['align'] }}</div>{{ /if }}
{{ /dynamic }}
