# ホログラム 100

このチュートリアルでは、Unity を使ってビルドする基本的なホログラフィック
アプリを作成する方法について順を追って説明します。作成後のプロジェクトは、ホログラフィック
アプリを Unity でビルドする場合の開始テンプレートとして機能します。

## 前提条件

-   [*適切なツールをインストール*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)して構成した
    Windows 10 PC。

## チュートリアルの内容

-   [第 1 章 – プロジェクトの新規作成](holograms_100.md#第-1-章--プロジェクトの新規作成)

-   [第 2 章 - カメラのセットアップ](holograms_100.md#第-2-章---カメラのセットアップ)

-   [第 3 章 – ホログラムの作成](holograms_100.md#第-3-章--ホログラムの作成)

-   [第 4 章 - Unity から Visual Studioへのエクスポート](holograms_100.md#第-4-章---unity-から-visual-studio-へのエクスポート)

    -   [4.1 Unityのパフォーマンス設定](holograms_100.md#unity-のパフォーマンス設定)

    -   [4.2 Unityのビルド設定](holograms_100.md#unity-のビルド設定)

    -   [4.3 Windows Holographicのエクスポート指定](holograms_100.md#windows-holographic-のエクスポート指定)

    -   [4.4 Visual Studioソリューションのエクスポート](holograms_100.md#visual-studio-ソリューションのエクスポート)

    -   [4.5 Windows.Holographicへのアプリのターゲット指定](holograms_100.md#windowsholographic-へのアプリのターゲット指定)

-   [第 5 章 – ビルドと配置](holograms_100.md#第-5-章--ビルドと配置)

-   [関連項目](holograms_100.md#関連項目)

## 第 1 章 – プロジェクトの新規作成

Unity
を使ってアプリをビルドするには、まず、プロジェクトを作成する必要があります。プロジェクトとはフォルダーのことです。このフォルダーには、Maya、Max
Cinema 4D、Photoshop などのデジタル
コンテンツ作成ツールからインポートするすべてのアセットや、Visual Studio
やお気に入りのコード
エディターで作成するすべてのコードが含まれます。また、シーン、アニメーションなど、さまざまな種類の
Unity アセットをエディターで組み立てるときに Unity
によって作成される任意の数のコンテンツ
ファイルもこのフォルダーに保持されます。Unity プロジェクトでは、Visual
Studio のソリューション ファイル (\*.sln)
のような一元管理型のプロジェクト ファイルを利用しません。Unity
プロジェクトのベースになるのは、単なるフォルダー構造です。

Unity プロジェクトのスクリプト ファイルも、プロジェクト ファイル (Visual
Studio の場合は \*.csproj) では一元管理されません。Unity はプロジェクト
フォルダー内の C\# ファイルを自動的に検出します。UWP
アプリをビルドして配置する場合、Unity では必要なアセットとコード
ファイルをすべて含む Visual Studio
ソリューションとしてプロジェクトをエクスポートできます。

1.  Unity を起動します。

2.  \[New\] (新規作成) を選びます。

3.  プロジェクト名 (「HelloHolograms」など) を入力します。

4.  プロジェクトの保存先を入力します。

5.  \[3D\] トグルが選択されていることを確認します。

6.  \[Create project\] (プロジェクトの作成) を選びます。

## 第 2 章 - カメラのセットアップ

Unity のメイン カメラ (Main Camera) は、ヘッド
トラッキングと立体視レンダリングを処理します。このメイン カメラを
HoloLens と一緒に使うには、メイン カメラにいくつか変更を加えます。

まず、アプリをレイアウトしやすくするために、ユーザーの開始位置を (**X**:
0, **Y**: 0, **Z**: 0) と考えます。メイン
カメラはユーザーの頭の動きを追跡することから、ユーザーの開始位置を設定する場合は、メイン
カメラの開始位置を設定します。

1.  \[Hierarchy\] (階層) パネルで、\[Main Camera\] (メイン カメラ)
    を選びます。

2.  \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)
    コンポーネントで、\[Position\] (位置) を (**X**: 0, **Y**: 1, **Z**:
    -10) から (**X**: 0, **Y**: 0, **Z**: 0) に変更します。

次に、カメラの既定の背景を変更する必要があります。ホログラフィック
アプリでは、カメラによってレンダリングされるあらゆるものの背景に、スカイボックス
(Skybox ) テクスチャではなく現実の世界を表示します。

1.  \[Hierarchy\] (階層) パネルで \[Main Camera\] (メイン カメラ)
    を選んだ状態で、\[Inspector\] (インスペクター) パネルの \[Camera\]
    (カメラ) コンポーネントで、\[Clear Flags\] (クリア フラグ)
    ボックスの一覧の \[Skybox\] (スカイボックス) を \[Solid Color\]
    (単色) に変更します。

2.  \[Background\] (背景) で色の選択ツールを選び、\[RGBA\] 値を (0, 0,
    0, 0) に変更します。

最後に、ユーザーとホログラムの距離が近づいたときに、ユーザーの目の近くにホログラムがレンダリングされないように、クリッピング平面の近い方の距離を
[*HoloLens 推奨*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Camera_in_Unity.html#clip_planes)の
0.85 メートルに設定します。

1.  \[Hierarchy\] (階層) パネルで \[Main Camera\] (メイン カメラ)
    を選んだ状態で、\[Inspector\] (インスペクター) パネルの \[Camera\]
    (カメラ) コンポーネントで、\[Clipping Planes\] (クリッピング平面) の
    \[Near\] (近く) フィールドの値を既定値の 0.3 から HoloLens 推奨の
    0.85 に変更します。

## 第 3 章 – ホログラムの作成

Unity プロジェクトでのホログラムの作成は、Unity
で他のオブジェクトを作成するのと変わりません。Unity
の座標系は現実世界にマップされます (Unity での 1 メートルは現実世界の 1
メートルとほぼ同じです)。そのため、ユーザーの前にホログラムを配置するのは簡単です。

1.  \[Hierarchy\] (階層) パネルの左上隅にある \[Create\] (作成)
    ボックスの一覧を選び、\[3D Object\] (3D オブジェクト)、\[Cube\]
    (キューブ) の順に選びます。

2.  \[Hierarchy\] (階層) パネルで、新しく作成した \[Cube\] (キューブ)
    を選びます。

3.  \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)
    コンポーネントで \[Position\] (位置) を (**X**: 0, **Y**: 0,
    **Z**: 2) に変更します。これにより、ユーザーの開始位置より 2
    メートル前にキューブが配置されます。

4.  \[Transform\] (変換) コンポーネントの \[Rotation\] (回転) を (**X**:
    45, **Y**: 45, **Z**: 45) に変更し、\[Scale\] (スケール) を (**X**:
    0.25, **Y**: 0.25, **Z**: 0.25)
    に変更します。これにより、キューブのスケールは 0.25
    メートルに設定されます。

5.  シーンの変更を保存するには、\[File\] (ファイル)、\[Save Scene\]
    (シーンの保存) の順に選び、シーンに名前を付けてから、\[Save\] (保存)
    を選びます。

## 第 4 章 - Unity から Visual Studio へのエクスポート

HelloHolograms の Unity
での作業はこれで完了です。そこで、このプロジェクトを Visual
Studio、そして HoloLens にエクスポートします。

### Unity のパフォーマンス設定

Unity の画質設定

HoloLens
ではフレームレートを高く保つことが非常に重要です。そこで、最高のパフォーマンスを得るため、画質の設定を調整します。詳しいパフォーマンス情報については、「[*Unity のパフォーマスに関する推奨事項*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/performance_recommendations_for_unity)」をご覧ください。

1.  \[Edit\] (編集)、\[Project Settings\]
    (プロジェクトの設定)、\[Quality\] (画質) の順に選びます。

2.  Windows ストアのロゴの下にあるボックスを選び、\[Fastest\] (最速)
    をオンにします。Windows ストアの列の \[Fastest\] (最速)
    行のボックスが緑色になったら、正しく設定されたことになります。

### Unity のビルド設定

ここでは、ユニバーサル Windows プラットフォーム
アプリとしてエクスポートする Unity プロジェクトを指定します。

1.  \[File\] (ファイル)、\[Build Settings\] (ビルド設定)
    の順に選びます。

2.  \[Platform\] (プラットフォーム) の一覧で、\[Windows Store\] (Windosw
    ストア) を選びます。

3.  \[SDK\] を \[Universal 10\] に設定します。

4.  \[Build Type\] (ビルドの種類) を \[D3D\] に設定します。

### Windows Holographic のエクスポート指定

ここで、エクスポートするアプリが 2D ビューではなくホログラフィック
ビューを作成することを Unity
に認識させる必要があります。そのためには、HoloLens
を仮想現実デバイスとして追加します。

1.  \[Build Settings\] (ビルド設定) ウィンドウで \[Player Settings\]
    (プレーヤーの設定)\] を開きます。

2.  \[Settings for Windows Store\] (Windows ストアの設定)
    タブを選びます。

3.  \[Other Settings\] (その他の設定) グループを展開します。

4.  \[Rendering\] (レンダリング) セクションで、\[Virtual Reality
    Supported\] (仮想現実のサポート) チェック ボックスをオンにして新しい
    \[Virtual Reality Devices)\] (仮想現実デバイス)
    の一覧を追加し、サポート対象のデバイスの一覧に "Windows Holographic"
    が表示されることを確認します。

### Visual Studio ソリューションのエクスポート

これで、Unity プロジェクトにすべての設定が適用され、HoloLens アプリ用
Visual Studio
ソリューションとして正しくエクスポートされるようになります。

1.  \[Build Settings\] (ビルド設定) ウィンドウに戻ります。

2.  \[Add Open Scenes\] (オープン シーンの追加)
    をクリックして、シーンを追加します。

3.  \[Windows Store\] (Windows ストア) のビルド設定で \[Unity C\#
    Projects\] (Unity C\# プロジェクト) チェック
    ボックスをオンにします。

4.  \[Build\] (ビルド) をクリックします。

5.  \[New Folder\] (新しいフォルダー)
    をクリックし、フォルダーに「App」という名前を付けます。

6.  App フォルダーを選んだ状態で、\[Select Folder\] (フォルダーの選択)
    をクリックします。

7.  Unity によってビルドが完了すると、エクスプローラー
    ウィンドウが表示されます。

8.  エクスプローラーで App フォルダーを開きます。

9.  生成された Visual Studio ソリューション (この例では
    HelloHolograms.sln) を開きます。

### Windows.Holographic へのアプリのターゲット指定

既定では、Unity からエクスポートしたユニバーサル Windows
プラットフォーム アプリは、Windows 10
デバイスでしか機能しません。Holographic アプリの場合、HoloLens
でしか利用できない機能をいくつか利用します。HoloLens
以外のデバイス向けのフォールバック動作を組み込まない場合の最善の方法は、Holographic
デバイスのみで実行するようにアプリのターゲットを指定することです。

1.  Visual Studio で、ソリューション エクスプローラーの
    \[Package.appxmanifest\] を右クリックし、\[コードの表示\]
    を選びます。

2.  TargetDeviceFamily を指定している行を探し、Name="Windows.Universal"
    を Name="Windows.Holographic" に変更します。

3.  同じ行の MaxVersionTested="10.0.10240.0" を
    MaxVersionTested="10.0.10586.0" に変更します。

4.  Package.appxmanifest を保存します。

## 第 5 章 – ビルドと配置

最後に、Unity
からエクスポートしたプロジェクトをビルドし、デバイスに配置して使ってみます。

1.  Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から
    \[Release\]、\[ARM\] から \[X86\] に変更します。

ここで、HoloLens
に配置する場合とエミュレーターに配置する場合とでは指示が異なります。お使いの設定に応じて以下の指示に従います。

### Wi-Fi 接続の HoloLens

1.  \[ローカル コンピューター\] の横にある矢印をクリックし、配置先を
    \[リモート コンピューター\] に変更します。

2.   [*HoloLens デバイスの IP アドレス*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Connecting_to_Wi-Fi_on_HoloLens.html#identifying_the_hololens_ip_address_on_the_wi-fi_network)を入力し、\[認証モード\]
    を \[ユニバーサル (暗号化されていないプロトコル)\] に変更します。


3.  \[デバッグ\]、\[デバッグなしで開始\]
    の順に選びます。デバイスに初めて配置する場合は、[*Visual Studio とのペアリング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#pairing_your_device)が必要です。

### USB 接続の HoloLens

1.  \[ローカル コンピューター\] の横にある矢印をクリックし、配置先を
    \[デバイス\] に変更します。

2.  \[デバッグ\]、\[デバッグなしで開始\] の順に選びます。  

### エミュレーター

1.  \[デバイス\] の横にある矢印をクリックし、\[HoloLens Emulator\]
    (HoloLens エミュレーター) を選びます。

2.  \[デバッグ\]、\[デバッグなしで開始\] の順に選びます。

### アプリのテスト

これでアプリを配置したので、キューブをあちこち移動して、目の前にキューブが浮かび上がるのを観察します。

## 関連項目

-   [*Unity 開発の概要*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/unity_development_overview)
-   [*Unity と Visual Studio による作業のベスト プラクティス*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/best_practices_for_working_with_unity_and_visual_studio)
-   [*ホログラム 101*](holograms_101.md)
-   [*ホログラム 101E*](holograms_101e.md)
