# Spectator View

<img src="media/image1.png" width="300" height="366">

Spectator View のセットアップ

複合現実ヘッドセットを着用していると、第三者が同じ体験をしていないことを忘れがちです。SpectatorView は、HoloLens の利用者が見ている世界を、第三者が 2D 画面で見ることができるようにします。Spectator View を使用するには、以下の 4 つの要素が必要です。

1.  [*ホログラフィック共有エクスペリエンス*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/shared_holographic_experiences)に基づき、第三者の視点を具体的に実現するためにビルドされたアプリ。
2.  HoloLens を着用し、アプリを使用するユーザー。
3.  第三者の視点でビデオを録画する Spectator View カメラ装置。
4.  共有エクスペリエンス アプリを実行し、ホログラムを Spectator View ビデオに合成するデスクトップ PC。

<img src="media/image2.jpeg" width="500" height="333">

## 本書の内容

-   [1 ユースケース](SpectatorView.md#ユースケース)
-   [2 ビデオキャプチャ技法の比較](SpectatorView.md#ビデオキャプチャ技法の比較)
-   [3 ハードウェア購入リスト](SpectatorView.md#ハードウェア購入リスト)
-   [4 ソフトウェア コンポーネント](SpectatorView.md#ソフトウェア-コンポーネント)
-   [5 独自の Spectator Viewカメラの作成](SpectatorView.md#独自の-spectator-view-カメラの作成)
    -   [5.1 装置の組み立て](SpectatorView.md#装置の組み立て)
    -   [5.2 PC のセットアップ](SpectatorView.md#pc-のセットアップ)
    -   [5.3 カメラのセットアップ](SpectatorView.md#カメラのセットアップ)
-   [6 キャリブレーション](SpectatorView.md#キャリブレーション)
-   [7 コンポジター](SpectatorView.md#コンポジター)
-   [8 Unityアプリ](SpectatorView.md#unity-アプリ)
-   [9 関連項目](SpectatorView.md#関連項目)

## ユースケース

<img src="media/image3.jpeg" width="350" height="197">

Spectator View での写真のキャプチャ シナリオの例

<img src="media/image4.gif" width="350" height="197">

Spectator View でのビデオのキャプチャ シナリオの例

このテクノロジが適切に機能する重要なシナリオは 3 つあります。

1.  **写真のキャプチャ**

    このテクノロジを使用して、ホログラムの高解像度画像をキャプチャできます。キャプチャした画像は、マーケティングイベントでのコンテンツの展示、見込み顧客への送付、Windows ストアへのアプリケーションの提出などに使用できます。画像をキャプチャするには、高性能デジタル一眼レフカメラなど、写真撮影用のカメラを決めることになります。

2.  **ライブ デモ**

    Spectator View は、カメラの位置を固定または制御できるため、ライブデモに適したアプローチです。高性能ビデオカメラを使用できるため、大画面用の高画質画像も作成できます。画面でのライブデモのストリーミングにも適しているため、順番を待つ参加者が列を成すことでしょう。

3.  **ビデオのキャプチャ**

    ビデオは、ホログラフィックアプリのエクスペリエンスを多くの人々と共有する場合に物語性が最も高い方法です。Spectator View では、アプリの紹介方法に最も適した、カメラ、レンズ、フレームを選ぶことができます。また、使用可能なビデオハードウェアに応じて、ビデオの画質を管理できます。

## ビデオキャプチャ技法の比較

[*複合現実キャプチャ*](https://developer.microsoft.com/en-us/windows/mixed-reality/mixed_reality_capture)
(MRC) は、HoloLens 装着者が一人称視点で目にしているものをコンポジットビデオにします。Spectator View は第三者の視点からビデオを生成するため、ビデオを見る人は、ホログラムと HoloLens デバイスを装着しているユーザーが同時に存在する環境を目にすることができます。また、カメラを選択できるため、MRC 画像に使用される HoloLens 組み込みのカメラに比べて、高解像度、高画質の画像を生成できます。そのため、Spectator View は Windows ストアのアプリ画像、マーケティングビデオ、観客向けのライブ ビューイングの投影などに適しています。

<img src="media/image5.jpeg" width="300" height="270">
Microsoft の基調講演で使用された Spectator View プロフェッショナルカメラ

Microsoft HoloLens が 2015 年 1 月に発表された当初から、Spectator View は、HoloLens
のエクスペリエンスを観客に提示するのに不可欠な要素になっています。Spectator View のプロフェッショナル用設定は、高い価格が設定されていますが、大きな需要があります。たとえば、図のカメラは GenLock 信号を使用して、正確なタイミングで HoloLens のトラッキングシステムと同期を取れるようにしています。このプロフェッショナル用設定では、HoloLens を直接装着している人のエクスペリエンスとホログラムを安定して一致させながら、Spectator View カメラを動かすことできます。

オープンソース版の Spectator Viewでは、設定全体のコストを大きく下げるため、カメラを動かす機能を犠牲にしています。オープンソース プロジェクトでは、HoloLens に固定した外部カメラを使って、ホログラフィック Unity プロジェクトの高解像度画像やビデオを撮影します。**ライブデモの最中は、カメラは動かさず、同じ位置に固定します。** カメラが動くと、ホログラムにぶれやずれが起きる可能性があります。これは、ビデオフレームのタイミングと PC でのホログラムのレンダリングのタイミングが、正確に同期されていないために起こります。そのため、カメラを固定するか、動きを制限することで、HoloLens 装着者が目にしているものに近い映像を生成できます。

アプリを Spectator View対応にするには、[*共有エクスペリエンス*](../Academy/holograms_240.md)アプリをビルドし、そのアプリが HoloLens とデスクトップの Unity エディター内の両方で動作できるようにします。デスクトップ版のアプリには、ビデオフィードとレンダリングされたホログラムを合成する、組み込みの追加コンポーネントを含めます。

## ハードウェア購入リスト

<img src="media/image6.jpeg" width="350" height="232">

Spectator View 装置

以下はハードウェアの推奨リストですが、他の互換装置を試してもかまいません。

|  ハードウェア コンポーネント  |  推奨  |
| ---- | ---- |
|  HoloLens エミュレーターを含み、ホログラフィック開発用に構成した PC。   |      |
|  HDMI 出力端子または写真キャプチャ SDK を備えたカメラ。  |  写真とビデオのキャプチャについては、[*Canon EOS 5D Mark III*](https://www.amazon.co.jp/dp/B007G3SSP8) カメラが Microsoft によって検証済みです。ライブ デモについては、[*Blackmagic Design の Blackmagic Production Camera4K*](https://www.amazon.co.jp/dp/B00CWLSHYG) が Microsoft によって検証済みです。HDMI 出力端子を備えたカメラ (GoPro など) はすべて機能します。Microsoft が公開しているビデオの多くは [*Canon EF 14mm f/2.8L II USM 超広角単焦点レンズ*](https://www.amazon.co.jp/dp/B000V9F3BG) を使用していますが、ニーズに合ったレンズを選択してください。  |
|  カメラからカラー フレームを取得して装置のキャリブレーションを行い、合成シーンのプレビューを表示するための PC 用キャプチャ カード。  |  [*Blackmagic Design の Intensity Pro 4K キャプチャ カード*](https://www.amazon.co.jp/dp/B00U3QNP7Q)が Microsoft によって検証済みです。  |
|  ケーブル  |  カメラをキャプチャ カードに取り付けるための [*HDMI からミニ HDMI への変換ケーブル*](https://www.amazon.co.jp/dp/B014I8UHXE)。使用するカメラに合った HDMI フォーム ファクターを購入します (たとえば、GoPro は[*マイクロ HDMI*](https://www.amazon.co.jp/dp/B014I8U33I) 経由で出力します)。<br>プレビュー用モニターまたはテレビで合成フィードを表示するための [*HDMI ケーブル*](https://www.amazon.co.jp/dp/B014I8TC4E/ref=twister_B016I3XG0S?_encoding=UTF8&th=1)。|
|    HoloLens と カメラをつなぐ、機械加工済みアルミニウム製ブラケット (取り付け金具)。詳細については、OSS プロジェクトの README を参照してください。   |     |
|    HoloLens のマウント部とカメラのホットシューをつなぐ、3D プリンター製アダプター。詳細については、OSS プロジェクトの README を参照してください。    |     |
|  ホットシュー アダプターを取り付ける雲台 (ホットシュー ファスナー)。  |  [*雲台*](https://www.amazon.co.jp/dp/B010EIQANS) (訳注：訳者は[こちら](https://www.amazon.co.jp/gp/product/B008604QZQ/)の雲台を使っています。)  |
|  各種ナット、ボルト、工具。  |  [*1/4-20 インチのナット*](https://www.amazon.co.jp/dp/B014S9NSE8)<br>[*1/4-20 x 3/4 インチのボルト*](https://www.amazon.com/dp/B004S6RZPK)(訳注：Amazon.co.jpへのリンクがなかったので、Amazon.comのリンクになっています)<br>[*7/16 インチのナット ドライバー*](https://www.amazon.co.jp/dp/B000BPG4CW)<br>[*T15 トルクス ドライバー*](https://www.amazon.co.jp/dp/B000KFXDWW)<br>[*T7 トルクス ドライバー*](https://www.amazon.co.jp/dp/B015RE8TE2)  |


## ソフトウェア コンポーネント

1.  [*Spectator View の GitHub プロジェクト*](https://github.com/Microsoft/HoloLensCompanionKit/tree/master/SpectatorView)からダウンロードしたソフトウェア。
2.  [*Blackmagic のキャプチャカード用 SDK*](https://www.blackmagicdesign.com/jp/support)。  
[最新のダウンロード情報\] から、「Desktop Video のデベロッパー SDK」を探します。

3.  [*Blackmagic Desktop Videoのランタイム*](https://www.blackmagicdesign.com/jp/support)。  
[最新のダウンロード情報\] から、「Desktop Video のソフトウェアアップデート」を探します。  
バージョン番号が SDK のバージョンと一致していることを確認します。

4.  [*OpenCV 3.1*](http://opencv.org/releases.html)。Blackmagic のキャプチャ カードなしでキャリブレーションまたはビデオのキャプチャを行う場合。

5.  [*Canon のSDK*](https://www.usa.canon.com/internet/portal/us/home/explore/solutions-services/digital-camera-sdk-information) (オプション)。  
Canon のカメラを使用し、Canon の SDK にアクセスできる場合、カメラを PC に接続して高解像度画像を撮影できます。

6.  ホログラフィック アプリ開発用の Unity。  
サポート対象のバージョンは、オープン ソースプロジェクトで確認できます。

7.  最新の更新プログラムを適用した Visual Studio 2015。

## 独自の Spectator View カメラの作成

**通知および免責事項:** HoloLens ハードウェアに変更を加える場合( " Spectator View " 向けに HoloLens をセットアップすることを含みますが、これに限定されません)、常に基本的な安全措置を講じなければなりません。あらゆる変更を加える前に、すべての指示書および取扱説明書をお読みください。自己責任において、すべての指示に従い、指示どおりに工具をお使いください。購入またはライセンスが許可される HoloLens には、品質保証規定付きのもの、または無保証のものがあります。保証のオプションについては、適用される[*HoloLens使用許諾契約書または使用販売条件*](http://microsoft.com/microsoft-hololens/ja-jp/order-now)をお読みください。

### 装置の組み立て

<img src="media/image7.gif" width="350" height="303">

HoloLens と DSLR カメラを使って組み立てた Spectator View 装置。

-   T7 ドライバーを使って、HoloLensからヘッドバンドを取り外します。ネジが緩んだら、クリップを使って反対側から押し出します。
-   HoloLens バイザー前面内側にあるネジぶたを、小型皿ネジドライバーで取り外します。
-   T15 ドライバーを使って、HoloLens のブラケットから小さなトルクスボルトを取り外し、U 字留め具とフック型留め具を取り外します。
-   ブラケットの上に HoloLens を置き、バイザー内部に露出した穴と、ブラケット正面の突起の位置を揃えます。HoloLens のアームを、ブラケットのにあるピンで定位置に固定します。
-   U 字留め具とフック型留め具を再度取り付け、ブラケットに HoloLens をしっかりと固定します。
-   雲台をカメラのホットシューに取り付けます。
-   マウント アダプターを雲台に取り付けます。
-   アダプターの狭い面が前を向き、カメラのレンズと平行になるようにアダプターを回転します。
-   7/16 ナット ドライバーを使って、1/4 インチナットでアダプターを定位置にしっかりと固定します。
-   HoloLens のバイザーの前面がカメラのレンズ正面にできるだけ近づくように、アダプターの反対側にブラケットの位置を決めます。
-   7/16 ナット ドライバーを使って、1/4 インチ ナットとボルト 4 つでブラケットを取り付けます。

### PC のセットアップ

-   前述の「ソフトウェアコンポーネント」で示したソフトウェアをインストールします。
-   マザーボード上の空き PCIe スロットにキャプチャカードを差し込みます。
-   キャプチャ カードの外側の HDMI スロット (HDMI 入力) にカメラからの HDMI ケーブルを接続します。
-   オプションのプレビュー用モニターにキャプチャ カードの中央の HDMI スロット (HDMI 出力) からの HDMI ケーブルを接続します。

### カメラのセットアップ

-   カメラをビデオ モードに切り替えて、3:4 のトリミング写真解像度ではなく、1920 x 1080 のフル解像度で出力します。
-   カメラの HDMI 設定で、「ミラーリング」または「デュアルモニター」を有効にします。
-   出力解像度を 1080 ピクセルに設定します。
-   「ライブビュー画面表示」をオフにして、合成フィードに画面のオーバーレイが現れないようにします。
-   カメラの「ライブ ビュー」をオンにします。
-   Canon SDK を使用していて、フラッシュを使う場合は、「ライブビューの静音撮影」を無効にします。
-   キャプチャ カードの外側の HDMI スロット (HDMI 入力) にカメラからの HDMI ケーブルを接続します。

## キャリブレーション

Spectator View の装置を設定後、カメラから HoloLens までの位置と回転のオフセットを取得するために、キャリブレーションを行う必要があります。

-   Calibration フォルダーにあるキャリブレーション用の Visual Studio ソリューション (Calibration.sln) を開きます。
-   このソリューションにはファイル (dependencies.props)があります。このファイルは、サードパーティ製ソースのインクルードファイルの位置情報に関するマクロを作成します。
-   このファイルを更新して、OpenCV 3.1、Blackmagic SDK、および Canon SDK (該当する場合) をインストールした場所を設定します。

<img src="media/image8.png" width="600" height="176">

-   フラットな固定面のキャリブレーションパターン (Calibration\\CalibrationPatterns\\2\_66\_grid\_FULL.png)を印刷します。
-   HoloLens と PC を USB 接続します。
-   stdafx.h にあるプリプロセッサ定義 HOLOLENS\_USER と HOLOLENS\_PW を、HoloLens Device Portal の資格情報に更新します。
-   HDMI 経由でカメラとキャプチャカードを接続し、カメラのスイッチをオンにします。
-   キャリブレーション ソリューションを実行します。
-   添付の動画のように、ビュー全体に格子縞パターンを動かします。

<img src="media/image9.gif" width="350" height="291">

Spectator View 装置のキャリブレーション

-   格子縞がビュー内に入ると、写真が自動的に撮影されます。次の姿勢に移る前に、HoloLens のバイザーでの白色光を探します。
-   完了したら、Calibration アプリで **Enter** キーを押して CalibrationData.txt ファイルを作成します。
-   保存先のファイルは Documents\\CalibrationFiles\\CalibrationData.txt です。
-   このファイルを調べ、キャリブレーションデータが正確かどうかを以下のように確認します。
    -   **DSLR RMS** が 0 に近い値であること。
    -   **HoloLens RMS** が 0 に近い値であること。
    -   **Stereo RMS** の値が20 ～ 50 の範囲内であること。これは、2 台のカメラ間で視野が異なる可能性があるためです。
    -   **Translation** は、HoloLens のカメラのレンズと取り付けたカメラのレンズの距離 (メートル単位)
        です。
    -   **Rotation** はほぼ同じになること。
    -   **DSLR\_fov** の値 y は、レンズの焦点距離とカメラ本体のクロップファクターから予想される垂直視野に近い値であること。
-   上記の値のいずれかが適正でなければ、再度キャリブレーションを行います。
-   このファイルを Unity プロジェクトの **Assets** ディレクトリにコピーします。

## コンポジター

コンポジターは Unity の拡張機能で、Unity エディターのウィンドウとして動作します。この機能を有効にするには、まず、コンポジターの Visual Studio ソリューションをビルドします。

-   Compositor フォルダーにあるコンポジターの Visual Studio ソリューション (Compositor.sln) を開きます。
-   前述のキャリブレーションソリューションと同じように、ファイル (dependencies.props)を更新します。キャリブレーションの手順を行った場合、このファイルは更新済みです。
-   \[Release\] モードと、Unity バージョンのアーキテクチャと同じアーキテクチャを指定して、ソリューション全体をビルドします。アーキテクチャが分からない場合は、\[x86\] と \[x64\] でそれぞれビルドします。
-   \[x64\] アーキテクチャでソリューションをビルドする場合、HoloLens で動作する SpatialPerceptionHelper プロジェクトは \[x86\] でビルドします。
-   Unity でアプリを実行している場合は、Unity を終了します。実行時に DLL が変わる場合は、Unity を再起動する必要があります。
-   Compositor フォルダーにある CopyDLL.cmd を実行し、このソリューションでビルドした DLL を Unity
    プロジェクトにコピーします。このスクリプトは、付属のサンプルプロジェクトに DLL をコピーします。自身のプロジェクトをセットアップしたら、プロジェクトの Assets ディレクトリを指すコマンド ライン引数を指定して CopyDLL を実行し、このディレクトリにも DLL をコピーします。
-   Unity サンプル アプリを起動します。

## Unity アプリ

コンポジターは、Unity エディターのウィンドウとして動作します。付属のサンプルプロジェクトにより、コンポジターの DLL をコピーするだけで、Spectator View で機能するようにすべての要素がセットアップされます。

Spectator View には、[*共有エクスペリエンス*](../Academy/holograms_240.md)として動作するアプリが必要です。つまり、HoloLens で起こるアプリの状態変化を、ネットワークに接続する Unity アプリにも送ってその状態を更新する必要があります。

新しく Unity プロジェクトを作成する場合は、最初にいくつかセットアップが必要になります。

-   サンプル プロジェクトの Assets/Addons/HolographicCameraRig を、新しく作成するプロジェクトにコピーします。
-   Sharing、csc.rsp、gmcs.rsp、smcs.rsp など、最新の HoloToolkit をプロジェクトに追加します。
-   CalibrationData.txt ファイルを、Assets ディレクトリに追加します。

<img src="media/image10.png" width="400" height="249">

-   HolographicCameraRig\\Prefabs\\SpectatorViewManager をシーンに追加して、以下のようにフィールドを設定します。
    -   \[Holographic Camera Manager\] フィールドには、HolographicCameraRig ディレクトリの HolographicCameraManager を設定します。
    -   \[Anchor\] フィールドには、HolographicCameraRig ディレクトリの Anchor を設定します。
    -   \[Sharing\] フィールドには、HoloToolkit の Sharing を設定します。
    -   メモ:ここで指定しているオブジェクトのいずれかがプロジェクト階層に既に存在している場合、上記の代わりに既存のオブジェクトが使用されます。
    -   \[Spectator View IP\] フィールドには、Spectator View 装置に取り付けた HoloLens の IP を設定します。
    -   \[Sharing Service IP\] フィールドには、HoloToolkit SharingService を実行している PC の IP を設定します。
    -   オプション: 複数の Spectator View 装置を複数の PC と接続している場合、\[Local Computer IP\] フィールドに、各 Spectator View 装置が通信する PC の IP を設定します。

<img src="media/image11.png" width="500" height="246">

-   HoloToolkit SharingService を開始します。
-   アプリを D3D UWP としてビルドして、Spectator View 装置に取り付けた HoloLens に配置します。
-   同じのアプリを、共有エクスペリエンスに参加するすべての HoloLens デバイスに配置します。
-   \[Edit\] 、\[Project settings\] 、\[Player\] の順に移動し、\[Run In Background\] チェックボックスをオンにします。

<img src="media/image12.png" width="400" height="124">

-   \[Spectator View\]、\[Compositor\] の順に移動し、\[Compositor\] ウィンドウを起動します。

<img src="media/image13.png" width="500" height="560">

-   このウィンドウでは、以下のことが可能です。
    -   ビデオの録画を開始する
    -   写真を撮影する
    -   ホログラムの不透明度を変更する
    -   フレーム オフセットを変更する(キャプチャ カードの遅延を考慮するため、色のタイムスタンプを調整する)
    -   撮影した画像や映像が保存されるディレクトリを開く
    -   Spectator View カメラから空間マッピング データを要求する(SpatialMappingManager がプロジェクトに存在する場合)
    -   シーンの合成ビューや、色、ホログラム、アルファチャンネルなどを個々に表示する
-   カメラのスイッチをオンにします。
-   Unity で \[Play\] をクリックします。
-   カメラが動くと、Unity 内のホログラムが現実世界に現れ、カメラのカラーフィードと相対位置に表示されます。

## 関連項目

-   [*複合現実キャプチャ*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/mixed_reality_capture)
-   [*開発者向け複合現実キャプチャ*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/mixed_reality_capture_for_developers)
-   [*ホログラフィック共有エクスペリエンス*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/shared_holographic_experiences)
-   [*ホログラム240*](../Academy/holograms_240.md)
-   [*GitHub の Spectator Viewコード*](https://github.com/Microsoft/HoloLensCompanionKit/tree/master/SpectatorView)
