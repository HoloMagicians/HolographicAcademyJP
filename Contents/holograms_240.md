**ホログラム 240**

ホログラムは、空間内をあちこち移動する動きに従って適切な位置を保つようにすることで、仮想世界の中で存在感が与えられます。HoloLens
はホログラムを適切な位置に保つため、さまざまな[*座標系*](https://developer.microsoft.com/ja-jp/windows/holographic/coordinate_systems)を使ってオブジェクトの位置や向きを追跡します。このような座標系をデバイス間で共有すると、共通のエクスペリエンスを生み出すことができ、共有されたホログラフィックの世界に参加することができます。

このチュートリアルでは、以下を習得します。

-   エクスペリエンスを共有するためのネットワークのセットアップ。

-   HoloLens デバイス間でのホログラムの共有。

-   共有されたホログラフィックの世界での他のユーザーの検出。

-   他のプレイヤーを標的にして弾を発射するようなインタラクティブな共有エクスペリエンスの作成。

**前提条件**

-   適切な[*ツールをインストール*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)して構成した、インターネットにアクセスできる
    Windows 10 PC。

-   [*開発用に構成*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#enabling_developer_mode)した
    HoloLens デバイスを 2 基以上。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-240-SharedHolograms.zip)はダウンロードします。Unity
    5.5 が必要です。

    -   依然として Unity 5.4
        のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-240.zip)を使用してください。

-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。フォルダー名はそのまま
    SharedHolograms を使います。

**チュートリアルの内容**

-   [*1 第 １ 章 -
    「ホログラム」の世界*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_1_-_holo_world)

-   [*2 第 2 章 –
    操作*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_2_-_interaction)

-   [*3 第 3 章 –
    共有座標*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_3_-_shared_coordinates)

-   [*4 第 4 章 –
    検出*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_4_-_discovery)

-   [*5 第 5 章 –
    配置*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_5_-_placement)

-   [*6 第 6 章 –
    現実世界の物理特性*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_6_-_real-world_physics)

-   [*7 第 7 章 – グランド
    フィナーレ*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_240#chapter_7_-_grand_finale)

**第 1 章 - 「ホログラム」の世界**

この章では、このチュートリアル最初の Unity
プロジェクトをセットアップし、ビルドと配置のプロセスについて順を追って説明します。

**目標**

-   ホログラフィック アプリを開発するために Unity をセットアップする。

-   ホログラムを見る。

**手順**

-   Unity を起動します。

-   \[Open\] (開く) を選びます。

-   最初にファイルを解凍した SharedHolograms
    フォルダーの場所を入力します。

-   \[Project Name\] (プロジェクト名) を選び、\[Select Folder\]
    (フォルダーの選択) をクリックします。

-   \[Hierarchy\] (階層) パネルで、\[Main Camera\] (メイン カメラ)
    を右クリックし、\[Delete\] (削除) を選びます。

-   HoloToolkit-Sharing-240 フォルダー、Prefabs フォルダー、Camera
    フォルダーの順に移動し Main Camera オブジェクトを探します。

-   Main Camera をドラッグし \[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Hierarchy\] (階層) パネルで、\[Create\] (作成)、\[Create Empty\]
    (空オブジェクトの作成) の順にクリックします。

-   新しく作成された GameObject を右クリックして、\[Rename\]
    (名前の変更) を選びます。

-   GameObject の名前を「HologramCollection」に変更します。

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)
    コンポーネントで \[Position\] (位置) を (x:0, y:-0.25, z:2)
    に設定します。

-   \[Project\] (プロジェクト) パネルの Holograms フォルダーで EnergyHub
    アセットに移動します。

-   EnergyHub オブジェクトを \[Project\] (プロジェクト)
    パネルからドラッグして HologramCollection の子になるように
    \[Hierarchy\] (階層) パネルにドラッグします。

-   \[File\] (ファイル)、\[Save Scene As\] (シーンに名前を付けて保存)
    の順に選びます。

-   シーンに「SharedHolograms」という名前を付けて、\[Save\] (保存)
    をクリックします。

-   Unity で \[Play\] (プレイ)
    をクリックしてホログラムをプレビューします。

-   再度 \[Play\] (プレイ) をクリックすると、プレビュー
    モードが停止します。

**Unity から Visual Studio へのプロジェクトのエクスポート**

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

-   \[Add Open Scenes\] (オープン シーンの追加)
    をクリックして、シーンを追加します。

-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windows
    ストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)
    をクリックします。

-   \[SDK\] を \[Universal 10\] に設定します。

-   \[Target device\] (ターゲット デバイス) を \[HoloLens\] に、\[UWP
    Build Type\] (UWP ビルドの種類) を \[D3D\] に設定します。

-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

-   \[Build\] (ビルド) をクリックします。

-   表示されるファイル エクスプローラー ウィンドウで、\[New Folder\]
    (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

-   \[App\] フォルダーをシングル クリックします。

-   \[Select Folder\] (フォルダーの選択) をクリックします。

-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。

-   App フォルダーを開きます。

-   SharedHolograms.sln を開いて Visual Studio を起動します。

-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から
    \[Release\]、\[ARM\] から \[X86\] に変更します。

-   \[ローカル コンピューター\] の横にある矢印をクリックして、\[リモート
    コンピューター\] を選びます。

    -   \[アドレス\] をお使いの HoloLens の名前または IP
        アドレスに設定します。デバイスの IP
        アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\]
        の順にクリックして IP アドレスを確認するか、Cortana に「私の IP
        アドレスを教えて」と質問します。

    -   \[認証モード\] は \[ユニバーサル\] のままにします。

    -   \[選択\] をクリックします。

-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**
    キーを押しながら **F5**
    キーを押します。デバイスに初めて配置する場合は、[*Visual Studio
    とのペアリング*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#pairing_your_device)が必要です。

-   HoloLens を着用して、EnergyHub ホログラムを探します。

**第 2 章 – 操作**

この章では、ホログラムを操作します。まず、[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)がわかるようにカーソルを追加します。次に、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)を追加し、手を使ってホログラムを空間に置きます。

**目標**

-   視線入力を使ってカーソルを制御する。

-   ジェスチャー入力を使ってホログラムを操作する。

**手順**

**視線**

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Gaze
    Manager」と入力します。検索結果を選びます。

-   HoloToolkit-Sharing-240 フォルダー、Prefabs フォルダー、Input
    フォルダーの順に移動し Cursor アセットを探します。

-   Cursor アセットをドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

**ジェスチャー**

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Add Component\] (コンポーネントの追加)
    をクリックして、検索フィールドに「Gesture
    Manager」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルで、HologramCollection を展開します。

-   子の EnergyHub オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「Hologram
    Placement」と入力します。検索結果を選びます。

-   \[File\] (ファイル)、\[Save Scene\] (シーンの保存)
    の順に選び、シーンを保存します。

**配置と実行**

-   前の章の手順を使ってビルドし、HoloLens に配置します。

-   HoloLens でアプリを起動後、頭をぐるりと動かすと EnergyHub
    が視線に従うようすがわかります。

-   ホログラムに視線を合わせるとカーソルが現れ、視線の先にホログラムがない場合は点光線が変わるようすがわかります。

-   空中をタップして、ホログラムを置きます。この時点のプロジェクトでは、ホログラムを一度しか置くことができませ
    (もう一度試すにはアプリを再配置します)。

**第 3 章 – 共有座標**

ホログラムを見て操作するのも楽しいですが、先に進みましょう。今度は最初の共有エクスペリエンスを設定します。つまり、全員で一緒に見ることができるホログラムにします。

**目標**

-   共有エクスペリエンスのためにネットワークをセットアップする。

-   共通参照ポイントを確立する。

-   複数のデバイスで座標系を共有する。

-   全員で同じホログラムを見る。

**手順**

-   \[Project\] (プロジェクト) パネルで HoloToolkit-Sharing-240
    フォルダー、Prefabs フォルダー、Sharing フォルダーの順に移動します。

-   Sharing をドラッグし \[Hierarchy\] (階層) パネルにドロップします。

次に、共有サービスを起動する必要があります。以下の手順は、共有エクスペリエンスに参加する
1 台の PC のみで行う必要があります。

-   Unity 上部のメニューで \[HoloToolkit-Sharing-240\]
    メニューを選びます。

-   ドロップダウンで \[Launch Sharing Service\] (共有サービスの起動)
    を選びます。

-   \[Private Network\] (プライベート ネットワーク) オプションのチェック
    ボックスをオンにし、ファイアウォールのプロンプトが表示されたら
    \[Allow Access\] (アクセスを許可) をクリックします。

-   \[Sharing Service\] (共有サービス) コンソール ウィンドウに表示される
    IPv4
    アドレスを書き留めます。これはサービスを実行しているコンピューターと同じ
    IP アドレスです。

これ以降の手順は共有エクスペリエンスに参加するすべての PC で行います。

-   \[Hierarchy\] (階層) パネルで Sharing オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルの \[Sharing Stage\]
    (共有ステージ) コンポーネントで、\[Server Addres\] (サーバー
    アドレス) を「localhost」から SharingService.exe
    を実行しているコンピューターの Ipv4 アドレスに変更します。

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   検索ボックスに「Import Export Anchor
    Manager」と入力します。検索結果を選びます。

-   \[Project\] (プロジェクト) パネルで Scripts フォルダーに移動します。

-   HologramPlacement スクリプトをダブルクリックして Visual Studio
    で開きます。

-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs\[表示\]

-   Unity に戻り、\[Hierarchy\] (階層) パネルの HologramCollection
    を選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「App State
    Manager」と入力します。検索結果を選びます。

**配置と実行**

-   HoloLens デバイス用にプロジェクトをビルドします。

-   最初に配置する HoloLens を １ つ指定します。EnergyHub
    を置く前にサービスにアップロードされるアンカーを待機する必要があります
    (これには 30 ～
    60秒かかります)。アップロードが完了するまで、タップするジェスチャーは無視されます。

-   EnergyHub
    を置くと、その場所がサービスにアップロードされます。その後、他のすべての
    HoloLens デバイスにアプリを配置できます。

-   新たな HoloLens がセッションに参加した直後は、そのデバイスの
    EnergyHub の場所が正しくない場合があります。ただし、アンカーと
    EnergyHub の場所がサービスからダウンロードされるとすぐに､EnergyHub
    は新しい共有の場所に移動します。30 ～ 60
    秒以内に正しい場所に移動しない場合は、アンカーを設定するときに最初の
    HoloLens
    がいた場所まで歩き、環境について多くの手掛かりを集めます。それでも場所が確定されない場合は、デバイスにアプリを再配置します。

-   デバイスの準備がすべて整いアプリを実行したら、EnergyHub
    を探します。ホログラムの場所とテキストが表示される方向に問題がないことを確認します。

**第 4 章 – 検出**

これで全員に同じホログラムが見えるようになります。今度は、ホログラムを共有する世界に接続している他の全員を見つけます。この章では、同じ共有セッション内の他のすべての
HoloLens デバイスの頭の場所と回転を把握します。

**目標**

-   共有エクスペリエンスに参加している全員を互いに見つける。

-   プレイヤーのアバターを選び、共有する。

-   全員の頭の横にプレイヤーのアバターを表示する。

**手順**

-   \[Project\] (プロジェクト) パネルで Holograms
    フォルダーに移動します。

-   PlayerAvatarStore をドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Project\] (プロジェクト) パネルで Scripts フォルダーに移動します。

-   AvatarSelector スクリプトをダブルクリックして Visual Studio
    で開きます。

-   コンテンツを以下のコードに置き換えます。

AvatarSelector.cs\[表示\]

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   検索ボックスに「Local Player
    Manager」と入力します。検索結果を選びます。

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   検索ボックスに「Remote Player
    Manager」と入力します。検索結果を選びます。

-   Visual Studio で HologramPlacement スクリプトを開きます。

-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs\[表示\]

-   Visual Studio で AppStateManager スクリプトを開きます。

-   コンテンツを以下のコードに置き換えます。

AppStateManager.cs\[表示\]

**配置と実行**

-   プロジェクトをビルドして HoloLens デバイスに配置します。

-   ビシッという音を聞いたら、アバターを選ぶメニューに移動して、空中をタップするジェスチャーを使ってアバターを選びます。

-   ホログラムを見ていないと、HoloLens
    がサービスとコミュニケーションしているときに、カーソル周りの点光線がさまざまな色に変わります。初期化中は濃い紫、アンカーのダウンロード中は緑、場所データのインポートまたはエクスポート中は黄、アンカーのアップロード中は青に変わります。カーソルの周りの点光線が既定の明るい紫の場合は、セッション内で他のプレイヤーと交流する準備ができています。

-   自分の空間に接続している他のプレイヤーを見ると、肩の上に浮かび頭の動きを模倣しているホログラフィック
    ロボットが見えます。

**第 5 章 – 配置**

この章では、アンカーを現実世界の面に配置できるようにします。ここでは共有座標系を使って共有エクスペリエンスに接続している全員の中間点にアンカーを置きます。

**目標**

-   プレイヤーの頭の位置を基に、空間マップ上にホログラムを置く。

**手順**

-   \[Project\] (プロジェクト) パネルで Holograms
    フォルダーに移動します。

-   CustomSpatialMapping をドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Project\] (プロジェクト) パネルで Scripts フォルダーに移動します。

-   AppStateManager スクリプトをダブルクリックして Visual Studio
    で開きます。

-   コンテンツを以下のコードに置き換えます。

AppStateManager.cs\[表示\]

-   \[Project\] (プロジェクト) パネルで Scripts フォルダーに移動します。

-   HologramPlacement スクリプトをダブルクリックして Visual Studio
    で開きます。

-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs\[表示\]

**配置と実行**

-   プロジェクトをビルドして HoloLens デバイスに配置します。

-   アプリの準備ができたら、円の中に立ちます。全員の中央に EnergyHub
    が現れるのがわかります。

-   タップして EnergyHub を置きます。

-   EnergyHub バックアップを選ぶために、音声コマンド「Reset Target」
    (ターゲットをリセット)
    を試します。全員がグループとして連携して、ホログラムを新しい場所に動かします。

**第 6 章 – 現実世界の物理特性**

この章では、現実世界の面から飛び出すホログラムを追加します。参加するプレイヤーが起動した各プロジェクトで空間が覆われるのを見守ります。

**目標**

-   現実世界の面から弾を打ち出す。

-   打ち出した弾が他のプレイヤーに見えるように共有する。

**手順**

-   \[Hierarchy\] (階層) パネルで HologramCollection
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Add Component\]
    (コンポーネントの追加) をクリックします。

-   検索ボックスに「Projectile
    Launcher」と入力します。検索結果を選びます。

**配置と実行**

-   ビルドして HoloLens デバイスに配置します。

-   アプリが全員のデバイスで実行されている状態で、空中をタップするジェスチャーを行うと、現実世界の面から弾が打ち出されます。

-   弾が他のプレイヤーのアバターに当たると何が起こるかを確認します。

**第 7 章 – グランド フィナーレ**

この章では、協力しないと見つからない入り口を明らかにします。

**目標**

-   秘密の入り口を明らかにするために、全員で協力してアンカーで弾を打ち出す。

**手順**

-   \[Project\] (プロジェクト) パネルで Holograms
    フォルダーに移動します。

-   Underworld アセットをドラッグして HologramCollection
    の子になるようにドロップします。

-   HologramCollection を選んだ状態で、\[Inspector\] (インスペクター)
    パネルの \[Add Component\] (コンポーネントの追加) をクリックします。

-   メニューの検索ボックスに「ExplodeTarget」と入力します。検索結果を選びます。

-   HologramCollection を選んだ状態で、EnergyHub
    オブジェクトを\[Hierarchy\] (階層) パネルから \[Inspector\]
    (インスペクター) パネルの \[Target\] フィールドにドラッグします。

-   HologramCollection を選んだ状態で、Underworld
    オブジェクトを\[Hierarchy\] (階層) パネルから \[Inspector\]
    (インスペクター) パネルの \[Underworld\]
    フィールドにドラッグします。

**配置と実行**

-   ビルドして HoloLens デバイスに配置します。

-   アプリが起動したら、協力して EnergyHub に弾を打ち出します。

-   闇の世界が現れたら、闇の世界のロボットに弾を打ち出します (ロボットに
    3 回当たるとさらに楽しみがあります)。


