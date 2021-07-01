<quest>

<div markdown="1" class="quest_obj">
<p class="q_info">
PCR検査とは何でしょうか？
</p>
<div class="a_info" markdown="1">
PCR検査とは新型コロナウイルス（COVID-19)感染診断検査で、PCR検査では遺伝子検査が用いられています。
</p>
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
検査結果が出るまでどれぐらいお日にちはかかりますか？
</p>
<div class="a_info" markdown="1">
最短でPCR検査を受けた当日夕方以降に検査結果がわかります。当日もしくは翌日午前中までには結果をお知らせ致します。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
中国大使館指定検査機関とお聞きしたのですが、中国語しか話せない方をご紹介できますか？
</p>
<div class="a_info" markdown="1">
当院は中国人スタッフも常駐しておりますので、お電話でお問い合せ頂けましたら対応致します。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
海外渡航で陰性証明書が必要なのですが何日ぐらいで発行できますか？
</p>
<div class="a_info" markdown="1">
最短で当日中に結果通知メールを送りダウンロード可能となりますが、紙媒体の証明書を窓口引取の場合は

"**翌日11：00~16：00まで**”にご来院下さい。

渡航先の国によっては紙での証明書以外に電子ファイル(PDF)でも問題ない国もございます。

※結果通知メール受信後、ご自身で印刷（カラー）して航空会社へ提出して下さい。

ご予約の際、渡航先の大使館・領事館のホームページ、または弊社スタッフにお問い合せ下さい。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
PCR検査を予約したいのですがどのように予約すればよろしいでしょうか？
</p>
<div class="a_info" markdown="1">
基本、事前の必要事項の入力が多いため予約サイトでお受けしております。

予約サイトは[(こちら)](https://app.online-karte.jp/rsv/p/onlinepcr/personal)になります。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
PCR検査のお支払い方法をお教えて下さい。
</p>
<div class="a_info" markdown="1">
名古屋ステーションクリニックでは下記の方法の支払いが可能です。

現金、クレジットカード（銀聯カード可）

※電子マネー(交通系ICカード、Pay関連)のお支払いは対応しておりません。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
検査当日、来院前に持参するものはございますか？
</p>
<div class="a_info" markdown="1">
来院時に支払いのご費用以外に本人確認を行うためパスポートをご持参下さい。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
検査当日、来院前に注意すべきことはございますか？
</p>
<div class="a_info" markdown="1">
検査は非常に繊細なため下記は極力行わないようにお願い致します。

1. 検査前の歯磨きは行わないで下さい。
2. 来院30分前には水以外の飲食を行わないで下さい。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
予約申込は何日前まで可能でしょうか？
</p>
<div class="a_info" markdown="1">
フライト日時が確定されてからのお申込受付となりますが、検査予約希望日の２営業日前からご予約可能です（※日祝除）

但し、ご予約状況により既に予約が埋まっている場合もございます。

できるだけお早めにお申込下さい。
</div>
</div>

<div markdown="1" class="quest_obj">
<p class="q_info">
WEBから予約をしようとしたところ、説明の文言が赤い文字で表示されていました。何か意味がありますか？
</p>
<div class="a_info" markdown="1">
渡航先国によってはお手続き・渡航条件等情報が不明な場合あり、“赤い”文字で以下のように表示されています。

（※各国の措置が突然変更となる場合がございます。最新の情報はお客様ご自身で、在日の各国大使館や各国にあります日本大使館のホームページ、外務省海外安全ホームページ、などをご確認いただき状況把握をお願い致します）


この場合、当院では出発の72時間前の英語版陰性証明書を発行致しますが、この条件で実際に渡航か可能かはお客様で各国大使館等にご確認をいただき、ご予約をご検討頂くようお願い致します。
</div>
</div>

</quest>

<script>
    var text = $('quest').html(),
    converter = new showdown.Converter(),
    html      = converter.makeHtml(text);
    $('quest').empty();
    $('quest').html(html);
    $('.q_info').click(function() {
            if ($(this).next('.a_info').css('height') === '0px') {
                $(this).next('.a_info').css('height', 'auto');
            } else {
                $(this).next('.a_info').css('height', '0px');
            }
    });
</script>