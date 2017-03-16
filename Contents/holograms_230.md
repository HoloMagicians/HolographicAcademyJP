**ホログラム 230**

[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)はホログラムに環境を教えることで、現実世界と仮想世界とを組み合わせます。ホログラム
230 (プロジェクト Planetarium) では、次の方法を習得します。

-   環境をスキャンして、HoloLens
    から開発コンピューターにデータを転送する。

-   シェーダーについて調べ、空間の視覚化にシェーダーを使う。

-   メッシュ処理を使って室内のメッシュをシンプルな平面に分割する。

-   [*ホログラム
    101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
    で習得した配置テクニックを活かして、環境のどこにホログラムを配置できるかについてのフィードバックを提供する。

-   オクルージョン効果を調べ、ホログラムが現実世界の物体の背後に隠れている場合でも、透視効果を使って見えるようにする。

**前提条件**

-   適切な[*ツールをインストール*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)して構成した
    Windows 10 PC。

-   ある程度基本的な C\# プログラミング能力。

-   [*ホログラム
    101*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_101)
    の修了。

-   [*開発用に構成*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#enabling_developer_mode)した
    HoloLens デバイス。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-230-SpatialMapping.zip)はダウンロードします。Unity
    5.5 が必要です。

    -   依然として Unity 5.4
        のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-230.zip)を使用してください。

-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

**メモ**

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\]
    の順に選び、\[マイ コードのみ\] を無効にする (チェック
    ボックスをオフにする) 必要があります。

**チュートリアルの内容**

-   [*1 Unity
    のセットアップ*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#unity_setup)

-   [*2 第 1 章 –
    スキャン*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#chapter_1_-_scanning)

-   [*3 第 2 章 –
    視覚化*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#chapter_2_-_visualization)

-   [*4 第 3 章 –
    処理*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#chapter_3_-_processing)

-   [*5 第 4 章 –
    配置*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#chapter_4_-_placement)

-   [*6 第 5 章 –
    オクルージョン*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#chapter_5_-_occlusion)

-   [*7
    終わりに*](https://developer.microsoft.com/ja-jp/windows/holographic/holograms_230#the_end)

**Unity のセットアップ**

-   Unity を起動します。

-   \[New\] (新規) を選び、新しいプロジェクトを作成します。

-   プロジェクトに「Planetarium」という名前を付けます。

-   \[3D\] トグルが選択されていることを確認します。

-   \[Create Project\] (プロジェクトの作成) をクリックします。

-   Unity が起動したら、\[Edit\] (編集)、\[Project Settings\]
    (プロジェクト設定)、\[Player\] (プレイヤー) の順に移動します。

-   \[Inspector\] (インスペクター) パネルで、緑の \[Windows Store\]
    (Windows ストア) アイコンを選びます。

-   \[Other Settings\] (その他の設定) を展開します。

-   \[Rendering\] (レンダリング) セクションで、\[Virtual Reality
    Supported\] (仮想現実のサポート) オプションのチェック
    ボックスをオンにします。

-   \[Windows Holographic\] が \[Virtual Reality SDKs\] (仮想現実 SDK)
    の一覧に表示されることを確認します。表示されない場合は、一覧下部にある
    \[+\] を選んで、\[Windows Holographic\] を選びます。

-   \[Publishing Settings\] (発行の設定) を展開します。

-   \[Capabilities\] (機能) セクションで、以下の設定のチェック
    ボックスをオンにします。

    -   InternetClientServer

    -   PrivateNetworkClientServer

    -   Microphone

    -   SpatialPerception

-   \[Edit\] (編集)、\[Project Settings\]
    (プロジェクト設定)、\[Quality\] (画質) の順に移動します。

-   \[Inspector\] (インスペクター) パネルの \[Windows Store\] (Windows
    ストア) アイコン下の \[Default\] (既定)
    列で、黒のドロップダウン矢印を選び、既定の設定を \[Fastest\] (最速)
    に変更します。

-   \[Assets\] (アセット)、\[Import Package\]
    (パッケージのインポート)、\[Custom Package\] (カスタム パッケージ)
    の順に移動します。

-   ...\\HolographicAcademy-Holograms-230-SpatialMapping\\Starting
    フォルダーに移動します。

-   Planetarium.unitypackage をクリックします。

-   \[Open\] (開く) をクリックします。

-   \[Import Unity Package\] (Unity パッケージのインポート)
    ウィンドウが表示されたら、\[Import\] (インポート) をクリックします。

-   Unity
    がこのプロジェクトを完成するのに必要なすべてのアセットをインポートするのを待ちます。

-   \[Hierarchy\] (階層) パネルで、\[Main Camera\] (メイン カメラ)
    を削除します。

-   \[Project\] (プロジェクト) パネルで HoloToolkit-SpatialMapping-230
    フォルダー、Utilities フォルダー、Prefabs
    フォルダーの順に移動し、Main Camera オブジェクトを探します。

-   \[Main Camera\] をドラッグし、\[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Hierarchy\] (階層) パネルで Directional Light
    オブジェクトを削除します。

-   \[Project\] (プロジェクト) パネルで Holograms フォルダーの Cursor
    オブジェクトに移動します。

-   \[Cursor\] をドラッグして、\[Hierarchy\] (階層) にドロップします。

-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで、\[Layer\] (レイヤー)
    ドロップダウンをクリックして、\[Edit Layers...\] (レイヤーの編集)
    を選びます。

-   \[User Layer 31\] の名前を「SpatialMapping」にします。

-   \[File\] (ファイル)、\[Save Scene As\] (シーンに名前を付けて保存)
    の順に選び、新しいシーンを保存します。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「Scenes」という名前を付けます。

-   ファイルに「Planetarium」という名前を付け、Scenes
    フォルダーに保存します。

**第 1 章 – スキャン**

**目標**

-   SurfaceObserver の詳細と、SurfaceObserver
    の設定がエクスペリエンスとパフォーマンスに与える影響を学ぶ。

-   室内のスキャン エクスペリエンスを作成し室内のメッシュを収集する。

**手順**

-   \[Project\] (プロジェクト) パネルで HoloToolkit-SpatialMapping-230
    フォルダー、SpatialMapping フォルダー、Prefabs
    フォルダーの順に移動し、SpatialMapping を探します。

-   SpatialMapping をドラッグし、\[Hierarchy\] (階層)
    パネルにドロップします。

**ビルドと配置 (パート 1)**

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

-   \[Add Open Scenes\] (オープン シーンの追加) をクリックして、ビルドに
    Planetarium シーンを追加します。

-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windows
    ストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)
    をクリックします。

-   \[SDK\] を \[Universal 10\] に、\[UWP Build Type\] (UWP
    ビルドの種類) を \[D3D\] に設定します。

-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

-   \[Build\] (ビルド) をクリックします。

-   \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

-   \[App\] フォルダーをシングル クリックします。

-   \[Select Folder\] (フォルダーの選択) をクリックします。

-   Unity によるビルドが終了すると、エクスプローラー
    ウィンドウが表示されます。

-   App フォルダーをダブルクリックして開きます。

-   Planetarium.sln をダブルクリックして Visual Studio で読み込みます。

-   Visual Studio 上部のツールバーを使って、構成を \[Release\]
    に変更します。

-   プラットフォームを \[x86\] に変更します。

-   \[ローカル コンピューター\] の横にある矢印をクリックして、\[リモート
    コンピューター\] を選びます。

-   \[アドレス\] フィールドに[*デバイスの IP
    アドレス*](https://developer.microsoft.com/ja-jp/windows/holographic/Connecting_to_WiFi.html#identifying_the_hololens_ip_address_on_the_wi-fi_network)を入力し、\[認証モード\]
    を \[ユニバーサル (暗号化されていないプロトコル)\] に変更します。

-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**
    キーを押しながら **F5** キーを押します。

-   Visual Studio の \[出力\]
    パネルで、ビルドと配置のようすを見守ります。

&nbsp;
-   アプリの配置が完了したら、室内を歩き回ります。カメラを取り巻く面が黒と白のワイヤーフレームのメッシュに覆われます。

-   周囲をスキャンします。壁、天井、床を見るようにします。

**ビルドと配置 (パート 2)**

ここで、空間マッピングがパフォーマンスに与える影響を調べます。

-   Unity で、\[Window\] (ウィンドウ)、\[Profiler\] (プロファイラー)
    の順に選びます。

-   \[Add Profiler\] (プロファイラーの追加)、\[GPU\]
    の順にクリックします。

-   \[Active Profiler\] (アクティブ プロファイラー)、\[&lt;Enter
    IP&gt;\] (IP を入力) の順にクリックします。

-   HoloLens の IP アドレスを入力します。

-   \[Connect\] (接続) をクリックします。

-   GPU がフレームのレンダリングにかかるミリ秒数を観察します。

-   デバイスでのアプリの実行を停止します。

-   Visual Studio に戻り、SpatialMappingObserver.cs
    を開きます。このファイルは、「Assembly-CSharp (ユニバーサル
    Windows)」プロジェクトの HoloToolkit\\SpatialMapping
    フォルダーにあります。

-   Awake() 関数を探して、次のコード行を追加します。\
    **TrianglesPerCubicMeter = 1200;**

-   デバイスにプロジェクトを再配置し、プロファイラーに再接続します。フレームのレンダリングにかかるミリ秒数の変化を観察します。

-   デバイスでのアプリの実行を停止します。

**保存と Unity での読み込み**

最後に、室内のメッシュを保存して、Unity に読み込みます。

-   Visual Studio に戻り、前のセクションで Awake() 関数に追加した
    TrianglesPerCubicMeter 行を削除します。

-   デバイスにプロジェクトを再配置します。これで、1 立方メートルあたり
    500 個の三角形が含まれる状態で実行されるようになります。

-   ブラウザーを開いて HoloLens の IP アドレスを入力し、\[Windows Device
    Portal\] (Windows デバイス ポータル) に移動します。

-   左側のパネルで \[3D View\] (3D ビュー) オプションを選びます。

-   \[Surface reconstruction\] (表面の再構築) で、\[Update\] (更新)
    を選びます。

-   HoloLens でスキャンした領域がディスプレイ
    ウィンドウに表示されるのを見守ります。

-   室内のスキャン結果を保存するには、\[Save\] (保存) を押します。

-   Downloads フォルダーを開いて、室内のモデル SRMesh.obj に移動します。

-   SRMesh.obj を Unity プロジェクトの Assets フォルダーにコピーします。

-   Unity で、\[Hierarchy\] (階層) パネルの SpatialMapping
    オブジェクトを選びます。

-   \[Object Surface Observer (Script)\] コンポーネントに移動します。

-   \[Room Model\] プロパティの横にある円をクリックします。

-   SRMesh オブジェクトに移動して選び、ウィンドウを閉じます。

-   \[Inspector\] (インスペクター) パネルの \[Room Model\] プロパティが
    SRMesh に設定されたことを確認します。

-   \[Play\] (プレイ) をクリックして、Unity のプレビュー
    モードを開始します。

-   SpatialMapping
    コンポーネントによって保存済みの室内モデルのメッシュが読み込まれます。これで、Unity
    でこのメッシュを使用できるようになります。

-   \[Scene\] (シーン) ビューに切り替えて、ワイヤーフレーム
    シェーダーが付いた状態で表示される室内モデル全体を確認します。

-   もう一度 \[Play\] (プレイ) をクリックしてプレビュー
    モードを終了します。

**メモ:** 次回 Unity でプレビュー
モードに入ると、保存済みの室内メッシュが既定で読み込まれます。

**第 2 章 – 視覚化**

**目標**

-   シェーダーの基礎を習得する。

-   周囲の状況を視覚化する。

**手順**

-   Unity の \[Hierarchy\] (階層) パネルで、SpatialMapping
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルの \[Spatial Mapping Manager
    (Script)\] コンポーネントに移動します。

-   \[Surface Material\] プロパティの横にある円をクリックします。

-   \[BlueLinesOnWalls\]
    マテリアルを見つけて選び、ウィンドウを閉じます。

-   \[Project\] (プロジェクト) パネルの Shaders フォルダーの
    \[BlueLinesOnWalls\] をダブルクリックして Visual Studio
    でこのシェーダーを開きます。

-   このシェーダーはシンプルなピクセル (頂点からフラグメントまでの)
    シェーダーで、以下のタスクを行います。

    1.  頂点の位置を仮想空間の位置に変換します。

    2.  頂点法線をチェックして、ピクセルが垂直かどうかを判断します。

    3.  レンダリングのためにピクセルの色を設定します。

**ビルドと配置**

-   Unity に戻り、\[Play\] (プレイ) をクリックして、プレビュー
    モードを開始します。

-   (保存したスキャン データから自動的に読み込まれる)
    室内メッシュのすべての垂直面に青い線がレンダリングされます。

-   \[Scene\] (シーン) タブに切り替えて室内のビューを調整し、Unity
    で室内全体のメッシュがどのように表示されるか確認します。

-   \[プロジェクト (Project)\] パネルの Materials
    フォルダーに移動し、\[BlueLinesOnWalls\] マテリアルを選びます。

-   Unity
    エディターでいくつかプロパティを変更し、その変更がどのように表示されるか確認します。

    -   \[Inspector\] (インスペクター) パネルで \[LineScale\]
        の値を変更して線の太さを調整します。

    -   \[Inspector\] (インスペクター) パネルで \[LinesPerMeter\]
        の値を調整して、各壁面に表示される線の数を変更します。

-   再度 \[Play\] (プレイ) をクリックして、プレビュー
    モードを終了します。

-   ビルドして HoloLens
    に配置し、シェーダーのレンダリングが実際の面にどのように表示されるか観察します。

Unity
でも適切にマテリアルがプレビューされますが、常にデバイスでレンダリングする方が適切です。

**第 3 章 – 処理**

**目標**

-   アプリで使用するために空間マッピング
    データを処理するテクニックを習得する。

-   空間マッピングデータを分析して平面を探し、三角形を削除する。

-   ホログラムの配置に平面を使用する。

**手順**

-   Unity で、\[Project\] (プロジェクト) パネルの Holograms フォルダーで
    SpatialProcessing オブジェクトに移動します。

-   SpatialProcessing オブジェクトをドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

SpatialProcessing オブジェクトには、空間マッピング
データを処理するためのコンポーネントが含まれています。SurfaceMeshesToPlanes.cs
は、空間マッピング
データに基づいて平面を見つけて、生成します。壁、床、天井を表現するために、アプリで平面を使用します。また、このオブジェクトには、空間マッピングのメッシュから頂点を削除できる
RemoveSurfaceVertices.cs
も含まれています。これは、メッシュに穴を開けたり、(平面を使用できるため)
必要なくなった余分な三角形を削除するのに使用できます。

-   Unity で、\[Project\] (プロジェクト) パネルの Holograms フォルダーで
    SpaceCollection オブジェクトに移動します。

-   SpaceCollection オブジェクトをドラッグして、\[Hierarchy\] (階層)
    パネルにドロップします。

-   \[Hierarchy\] (階層) パネルで、SpatialProcessing
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルの \[Play Space Manager
    (Script)\] コンポーネントに移動します。

-   PlaySpaceManager.cs をダブルクリックして Visual Studio で開きます。

PlaySpaceManager.cs
には、アプリ固有のコードを含みます。このスクリプトに機能を追加して、以下の動作を実現します。

1.  スキャンの制限時間 (10 秒) を超えたら、空間マッピング
    データの収集を停止します。

2.  空間マッピング データを以下のように処理します。

    1.  SurfaceMeshesToPlanes を使用して、(壁、床、天井などの)
        面として、仮想世界の簡単な表現を作成します。

    2.  RemoveSurfaceVertices
        を使用して、平面の境界内に収まる面の三角形を取り除きます。

3.  仮想世界のホログラムのコレクションを生成し、ユーザー近くの壁と床に配置します。

PlaySpaceManager.cs
でマークを付けたコーディングを完成するか、スクリプトを以下の完成版ソリューションに置き換えます。

PlaySpaceManager.cs \[表示\]

**ビルドと配置**

-   HoloLens に配置する前に、Unity で \[Play\] (プレイ)
    をクリックして、プレビュー モードを開始します。

-   ファイルから室内のメッシュが読み込まれたら、空間マッピング
    データのメッシュで処理が始まるまで 10 秒間待ちます。

-   処理が完了すると、床、壁、天井などを表す面が表示されます。

-   すべての面が見つかったら、カメラ近くの床のテーブル上に太陽系が表示されます。

-   また、カメラ近くの壁にポスターが 2 枚表示されます。\[Game\] (ゲーム)
    モードで表示されない場合は、\[Scene\] (シーン) タブに切り替えます。

-   再度 \[Play\] (プレイ) をクリックして、プレビュー
    モードを終了します。

-   いつものようにビルドして、HoloLens に配置します。

-   空間マッピング データのスキャンと処理が完了するのを待ちます。

-   各面が表示されたら、仮想世界で太陽系とポスターを確認します。

**第 4 章 – 配置**

**目標**

-   ホログラムが面にフィットするかどうかを判断する。

-   ホログラムが面にフィットするかどうかのフィードバックをユーザーに提供する。

**手順**

-   Unity の \[Hierarchy\] (階層) パネルで、SpatialProcessing
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルで \[Surface Meshes To Planes
    (Script)\] コンポーネントに移動します。

-   \[Draw Planes\] プロパティを \[Nothing\]
    に変更して、選択内容をクリアします。

-   \[Draw Planes\] プロパティを \[Wall\]
    に変更して、壁面だけをレンダリングします。

-   \[Project\] (プロジェクト) パネルの Scripts
    フォルダーで、\[Placeable.cs\] をダブルクリックして Visual Studio
    で開きます。

平面の検索が完了すると作成されるポスターとプロジェクション
ボックスには、Placeable
スクリプトが既にアタッチされています。必要なのは、一部のコードのコメントを解除することだけです。このスクリプトは以下を行います。

1.  境界キューブの 4
    つの角と中心からレイキャストすることで、ホログラムが面にフィットするかどうかを判断します。

2.  面法線をチェックし、ホログラムを配置するのに十分滑らかかどうかを判断します。

3.  ホログラムを囲む境界キューブをレンダリングして、配置中に実サイズを表示します。

4.  ホログラムの下と後ろに影を落として、壁または床のどこに配置するかを表示します。

5.  ホログラムを面に配置できない場合は影を赤でレンダリングし、配置できる場合は緑でレンダリングします。

6.  ホログラムの向きを再度設定して、面の種類 (垂直または水平)
    に揃え、一体感を出します。

7.  ジャンプやスナップの動作を避けるため、選択した面にホログラムを滑らかに配置します。

以下のコーディング作業のコメントをすべて解除するか、完成版のソリューションを使用します。

Placeable.cs \[表示\]

**ビルドと配置**

-   先ほどと同様、プロジェクトをビルドして HoloLens に配置します。

-   空間マッピング データのスキャンと処理が完了するのを待ちます。

-   太陽系が表示されたら、その下にあるプロジェクション
    ボックスに視線を向け、「選ぶ」ジェスチャーを使って動かします。プロジェクション
    ボックスが選択されている間は、プロジェクション
    ボックスの周りに境界キューブが表示されます。

-   頭を動かして室内のさまざまな場所に視線を向けます。プロジェクション
    ボックスが視線に追従します。プロジェクション
    ボックスの下の影が赤になったら、その面にはホログラムを配置できません。プロジェクション
    ボックスの下の影が緑になったら、もう一度「選ぶ」ジェスチャーを使ってホログラムを配置します。

-   壁にあるホログラフィック ポスターの 1
    枚を探して選び、新しい場所に移動します。ポスターが床と天井には配置できないことと、ポスターを動かすと正しく各壁の方に向くことがわかります。

**第 5 章 – オクルージョン**

**目標**

-   ホログラムが空間マッピングのメッシュによって遮られているかどうかを判断する。

-   オクルージョンのさまざまなテクニックを適用して、面白い効果を実現する。

**手順**

まず、空間マッピングのメッシュが現実世界を遮ることなく、他のホログラムを遮るようにします。

-   \[Hierarchy\] (階層) パネルで、SpatialProcessing
    オブジェクトを選びます。

-   \[Inspector\] (インスペクター) パネルの \[Play Space Manager
    (Script)\] コンポーネントに移動します。

-   \[Secondary Material\] プロパティの横にある円をクリックします。

-   \[Occlusion\] マテリアルを見つけて選び、ウィンドウを閉じます。

次に、地球に特別な動作を追加して、地球が (太陽のような)
別のホログラムや空間マッピングのメッシュに遮られたときに、青色で強調表示されるようにします。

-   \[Project\] (プロジェクト) パネルの Holograms フォルダーで
    SolarSystem オブジェクトを展開します。

-   \[Earth\] をクリックします。

-   \[Inspector\] (インスペクター) パネルの Earth のマテリアル
    (一番下のコンポーネント) に移動します。

-   \[Shader\] (シェーダー) のドロップダウンで、\[Custom\] (カスタム)
    を選び、シェーダーを \[OcclusionRim\]
    に変更します。これにより、地球が他のオブジェクトに遮られたときは必ず、地球の周りに青い強調表示がレンダリングされます。

最後に、太陽系の惑星の透視効果を有効にします。(Scripts\\SolarSystem
フォルダーにある) PlanetOcclusion.cs を編集して、以下を行います。

1.  惑星が SpatialMapping レイヤー (室内のメッシュと他の惑星)
    に遮られるかどうかを判断します。

2.  惑星が SpatialMapping
    レイヤーに遮られているときは必ず、惑星のワイヤー
    フレーム表現を表示します。

3.  惑星が SpatialMapping レイヤーに遮られていない場合は、惑星のワイヤー
    フレーム表現を非表示にします。

PlanetOcclusion.cs
のコーディング作業に従うか、以下の完成版ソリューションを使用します。

PlanetOcclusion.cs \[表示\]

**ビルドと配置**

-   いつものように、アプリをビルドして、HoloLens に配置します。

-   空間マッピング データのスキャンと処理が完了
    (壁に青い線が表示されます) するのを待ちます。

-   太陽系のプロジェクション
    ボックスを見つけて選び、このボックスを壁の横かカウンターの後ろに設置します。

-   面の後ろに隠すことで、基本的なオクルージョンを表示して、ポスターやプロジェクション
    ボックスを視界に入れることができます。

-   地球を探し、他のホログラムや面の後ろに隠れると必ず青い強調表示効果が表示されることを確認します。

-   惑星が壁や室内の他の面の後ろに移動するのを観察します。これで、透視が利用できるようになり、ワイヤーフレームのスケルトンを確認できます。

**終わりに**

お疲れ様でした。これでチュートリアル「ホログラム 230 –
空間マッピング」は終わりです。

-   環境をスキャンして空間マッピング データを Unity
    に読み込む方法を学びました。

-   シェーダーの基礎と、仮想世界を再度視覚化するためにマテリアルを使用する方法を学びました。

-   平面を見つけてメッシュから三角形を取り除く、新しい処理テクニックを学びました。

-   ホログラムを移動して、面の適切な位置に配置できるようになりました。

-   オクルージョンのさまざまなテクニックを体験し、透視効果を活用しました。


