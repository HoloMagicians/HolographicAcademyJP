# ホログラム 101

このチュートリアルでは、Unity を使ってビルドするプロジェクト全体について順を追って説明します。このプロジェクトでは、[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)、[*音声入力*](https://developer.microsoft.com/ja-jp/windows/holographic/voice_input)、[*空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_sound)、[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)など、Windows Holographic Platform と HoloLens の核となる機能を示します。

このチュートリアルの所要時間は約 1 時間です。

## 前提条件

-   [*適切なツールをインストール*](https://developer.microsoft.com/ja-jp/windows/holographic/install_the_tools)して構成した
    Windows 10 PC。
-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#enabling_developer_mode)
    HoloLens デバイス。

## プロジェクト ファイル

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-101.zip)はダウンロードします。Unity
    5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-101.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。フォルダー名はそのまま Origami を使用します。

## チュートリアルの内容

- [第 1 章 -「ホログラム」の世界](holograms_101.md#第-1-章---ホログラムの世界)
- [第 2 章 – 視線](holograms_101.md#第-2-章--視線)
- [第 3 章 – ジェスチャー](holograms_101.md#第-3-章--ジェスチャー)
- [第 4 章 – 音声](holograms_101.md#第-4-章--音声)
- [第 5 章 – 空間音響](holograms_101.md#第-5-章--空間音響)
- [第 6 章 – 空間マッピング](holograms_101.md#第-6-章--空間マッピング)
- [第 7 章 – ホログラフィックを楽しむ](holograms_101.md#第-7-章--ホログラフィックを楽しむ)
- [終わりに](holograms_101.md#終わりに)

## 第 1 章 - 「ホログラム」の世界

この章では、このチュートリアル最初の Unity
プロジェクトをセットアップし、ビルドと配置のプロセスについて順を追って説明します。

### 目標

-   ホログラフィック開発向けに Unity をセットアップする。
-   ホログラムを作成する。
-   作成したホログラムを確認する。

### 手順

-   Unity を起動します。
-   \[Open\] (開く) を選びます。
-   最初にファイルを解凍した Origami フォルダーの場所を入力します。
-   \[Origami\] を選び、\[Select Folder\] (フォルダーの選択)をクリックします。
-   Origami プロジェクトにはシーンが含まれていません。そのため、\[File\](ファイル) の \[Save Scene As\] (シーンに名前を付けて保存)を使って既定の空のシーンを新しいファイルに保存します。
-   新しいシーンに「Origami」という名前を付けて、\[Save\] (保存)をクリックします。

### メイン仮想カメラのセットアップ

-   \[Hierarchy\] (階層) パネルで \[Main Camera\] (メイン カメラ)を選びます。
-   \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)コンポーネントで \[Position\] (位置) を (**x**:0, **y**:0, **z**:0)に設定します。
-   \[Clear Flags\] (クリア フラグ) プロパティの一覧で \[Skybox\](スカイボックス) を \[Solid color\] (単色) に変更します。
-   \[Background\] (背景)フィールドをクリックして色の選択ツールを開きます。
-   \[R\]、\[G\]、\[B\] および \[A\] の各フィールドに 0 を設定します。

### シーンのセットアップ

-   \[Hierarchy\] (階層) パネルで、\[Create\] (作成)、\[Create Empty\](空オブジェクトの作成) の順にクリックします。
-   新しく作成された GameObject を右クリックして、\[Rename\](名前の変更) を選びます。GameObjectの名前を「OrigamiCollection」に変更します。
-   \[Project\] (プロジェクト) パネルで \[Holograms\]フォルダーから以下の操作を行います (\[Assets\] を展開して\[Holograms\] を選ぶか、\[Project\] (プロジェクト) パネルで\[Holograms\] フォルダーをダブルクリックします)。
    -   OrigamiCollection の子になるように、Stage を \[Hierarchy\](階層) パネルにドラッグします。
    -   OrigamiCollection の子になるように、Sphere1 を \[Hierarchy\](階層) パネルにドラッグします。
    -   OrigamiCollection の子になるように、Sphere2 を \[Hierarchy\](階層) パネルにドラッグします。
-   \[Hierarchy\] (階層) パネルで Directional Lightオブジェクトを右クリックし、\[Delete\] (削除) を選びます。
-   \[Holograms\] フォルダーから Lights を \[Hierarchy\] (階層)パネルのルートにドラッグします。
-   \[Hierarchy\] (階層) パネルで OrigamiCollection を選びます。
-   \[Inspector\] (インスペクター) パネルの \[Transform\] (変換)コンポーネントで \[Position\] (位置) を (**x**:0, **y**:-0.5,**z**:2.0) に設定します。
-   Unity で \[Play\] (プレイ)をクリックしてホログラムをプレビューします。
-   プレビュー ウィンドウに Origami オブジェクトが表示されます。
-   再度 \[Play\] (プレイ) をクリックすると、プレビューモードが停止します。

### Unity から Visual Studio へのプロジェクトのエクスポート

-   Unity で、\[File\] (ファイル)、\[Build Settings\] (ビルド設定)の順に選びます。
-   \[Platform\] (プラットフォーム) の一覧で \[Windows Store\] (Windowsストア) を選び、\[Switch Platform\] (プラットフォームの切り替え)をクリックします。
-   \[SDK\] を \[Universal 10\] に、\[Build Type\] (ビルドの種類) を\[D3D\] に設定します。
-   \[Unity C\# Projects\] (Unity C\# プロジェクト) チェックボックスをオンにします。
-   \[Add Open Scenes\] (オープン シーンの追加)をクリックして、シーンを追加します。
-   \[Build\] (ビルド) をクリックします。
-   表示されるファイル エクスプローラー ウィンドウで、\[New Folder\](新しいフォルダー)をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] (フォルダーの選択) をクリックします。
-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。
-   App フォルダーを開きます。
-   Origami.sln を (ダブルクリックして) 開きます。
-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から\[Release\]、\[ARM\] から \[X86\] に変更します。
-   \[デバイス\] ボタンの横にある矢印をクリックして、\[リモートデバイス\] を選びます。
    -   \[アドレス\] をお使いの HoloLens の名前または IPアドレスに設定します。デバイスの IPアドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\]の順にクリックして IP アドレスを確認するか、Cortana に「私の IPアドレスを教えて」と質問します。
    -   \[認証モード\] は \[ユニバーサル\] のままにします。
    -   \[選択\] をクリックします。
-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**キーを押しながら **F5**キーを押します。デバイスに初めて配置する場合は、[*Visual Studioとのペアリング*](https://developer.microsoft.com/ja-jp/windows/holographic/Using_Visual_Studio.html#pairing_your_device)が必要です。
-   ここで、Origami プロジェクトをビルドし、HoloLensに配置して実行します。
-   HoloLens を着用して、あたりを見回し、新しいホログラムを確認します。

## 第 2 章 – 視線

この章では、ホログラムを操作する 3 つの方法のうちの最初の １
つ、[*視線*](https://developer.microsoft.com/ja-jp/windows/holographic/gaze)について説明します。

### 目標

-   世界を固定するカーソルを使って視線を視覚化する。

### 手順

-   Unity プロジェクトに戻ります。\[Build Settings\] (ビルド設定)ウィンドウが開いたままの場合はこれを閉じます。
-   \[Project\] (プロジェクト) パネルで \[Holograms\]フォルダーを選びます。
-   Cursor オブジェクトを \[Hierarchy\] (階層) パネルのルートレベルにドラッグします。
-   Cursorオブジェクトをダブルクリックして、このオブジェクトを詳しく調べます。
-   \[Project\] (プロジェクト) パネルで \[Scripts\]フォルダーを右クリックします。
-   \[Create\] (作成) サブメニューをクリックします。
-   \[C\# Script\] (C\# スクリプト) を選びます。
-   スクリプトの名前を「WorldCursor」にします。メモ:名前は、大文字と小文字が区別されます。拡張子 .csを追加する必要はありません。
-   \[Hierarchy\] (階層) パネルで Cursor オブジェクトを選びます。
-   WorldCursor スクリプトをドラッグして、\[Inspector\] (インスペクター)パネルにドロップします。
-   WorldCursor スクリプトをダブルクリックして Visual Studioで開きます。
-   次のコードをコピーして WorldCursor.cs に貼り付け、\[すべて保存\]をクリックします。

WorldCursor.cs
```cs
using UnityEngine;

public class WorldCursor : MonoBehaviour
{
    private MeshRenderer meshRenderer;

    // Use this for initialization
    void Start()
    {
        // Grab the mesh renderer that&#39;s on the same object as this script.
        meshRenderer = this.gameObject.GetComponentInChildren&lt;MeshRenderer&gt;();
    }

    // Update is called once per frame
    void Update()
    {
        // Do a raycast into the world based on the user&#39;s
        // head position and orientation.
        var headPosition = Camera.main.transform.position;
        var gazeDirection = Camera.main.transform.forward;

        RaycastHit hitInfo;

        if (Physics.Raycast(headPosition, gazeDirection, out hitInfo))
        {
            // If the raycast hit a hologram...
            // Display the cursor mesh.
            meshRenderer.enabled = true;

            // Move the cursor to the point where the raycast hit.
            this.transform.position = hitInfo.point;

            // Rotate the cursor to hug the surface of the hologram.
            this.transform.rotation = Quaternion.FromToRotation(Vector3.up, hitInfo.normal);
        }
        else
        {
            // If the raycast did not hit a hologram, hide the cursor mesh.
            meshRenderer.enabled = false;
        }
    }
}
```

-   \[File\] (ファイル)、\[Build Settings\] (ビルド設定)の順に選んで、アプリをリビルドします。
-   前回 HoloLens の配置に使用した Visual Studioソリューションに戻ります。
-   確認が表示される場合には、\[再読み込み\] を選びます。
-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl**キーを押しながら **F5** キーを押します。
-   ここで、シーンを見回すと、カーソルが物体の形状にどのように関わるかがわかります。

## 第 3 章 – ジェスチャー

この章では、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/holographic/gestures)のサポートを追加します。ここでは紙で作った球体をユーザーが選ぶと、その球体が落ちるようにします。そのため、Unityの物理エンジンを使って重力を有効にします。

### 目標

-   「選ぶ」というジェスチャーを使ってホログラムを制御する。

### 手順

ここでは、最初にスクリプトを作成してから、「選ぶ」というジェスチャーを検出できるようにします。

-   \[Scripts\] フォルダーで、GazeGestureManagerというスクリプトを作成します。
-   GazeGestureManager スクリプトを \[Hierarchy\] (階層) パネルのOrigamiCollection オブジェクトにドラッグします。
-   Visual Studio で GazeGestureManagerスクリプトを開き、次のコードを追加します。

GazeGestureManager.cs \[表示\]

-   \[Scripts\] フォルダーでもう 1つスクリプトを作成し、今回は「SphereCommands」という名前を付けます。
-   \[Hierarchy\] (階層) ビューの OrigamiCollectionオブジェクトを展開します。
-   SphereCommands スクリプトを \[Hierarchy\] (階層) パネルの Sphere1オブジェクトにドラッグします。
-   SphereCommands スクリプトを \[Hierarchy\] (階層) パネルの Sphere2オブジェクトにドラッグします。
-   編集のために Visual Studioでスクリプトを開き、スクリプト既定のコードを次のコードに置き換えます。

SphereCommands.cs \[表示\]

-   アプリをエクスポートしてビルドし、HoloLens に配置します。
-   球体の １ つを見ます。
-   「選ぶ」ジェスチャーを行い、球体が下の面に落ちるようすを見守ります。

### 第 4 章 – 音声

この章では、2つの[*音声コマンド*](https://developer.microsoft.com/ja-jp/windows/holographic/voice_input)のサポートを追加します。「Reset world」 (世界をリセット) で落ちた球体を元の場所に戻し、「Drop sphere」(球を落とせ) で球体を落下させます。

### 目標

-   常にバックグラウンドで聞こえる音声コマンドを追加する。
-   音声コマンドに反応するホログラムを作成する。

### 手順

-   \[Scripts\] フォルダーで、SpeechManagerというスクリプトを作成します。
-   \[Hierarchy\] (階層) パネルの OrigamiCollection オブジェクトにSpeechManager スクリプトをドラッグします。
-   Visual Studio で SpeechManager スクリプトを開きます。
-   次のコードをコピーして SpeechManager.cs に貼り付け、\[すべて保存\]をクリックします。

SpeechManager.cs \[表示\]

-   Visual Studio で SphereCommands スクリプトを開きます。
-   このスクリプトを次のように更新します。

SphereCommands.cs \[表示\]

-   アプリをエクスポートしてビルドし、HoloLens に配置します。
-   球体の １ つを見て、「Drop Sphere」 (球を落とせ) と発話します。
-   「Reset World」 (世界をリセット)と発話し、球体を元の位置に戻します。

## 第 5 章 – 空間音響

この章では、アプリに音楽を追加してから、特定の動作で音響効果が引き起こされるようにします。ここでは[*空間音響*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_sound)を使用して、3D空間の特定の場所に効果音を設定します。

### 目標

-   仮想の世界でホログラムを聞く。

### 手順

-   Unity 上部のメニューで \[Edit\] (編集)、\[Project Settings\](プロジェクト設定)、\[Audio\] (オーディオ) の順に選びます。
-   右側の \[Inspector\] (インスペクター)パネルで、\[SpatializerPlugin\] (空間プラグイン) の設定で \[MS HRTFSpatializer\] を選びます。
-   \[Project\] (プロジェクト) パネルの \[Holograms\] フォルダーからAmbience オブジェクトを \[Hierarchy\] (階層) パネルのOrigamiCollection オブジェクトにドラッグします。
-   OrigamiCollection を選び、\[Inspector\] (インスペクター) パネルの\[Audio Source\] (オーディオ ソース)に移動します。以下のプロパティを変更します。
    -   \[Spatialize\] (空間) プロパティのチェック ボックスをオンにします。
    -   \[Play On Awake\] (起動時に再生) をチェック ボックスをオンにします。
    -   スライダーを右端までドラッグして、\[Spatial Blend\] (空間ブレンド) を \[3D\] に変更します。スライドを動かすと、値が0 から 1 の間で変化します。
    -   \[Loop\] (ループ) プロパティのチェック ボックスをオンにします。
    -   \[3D Sound Settings\] (3D 音響の設定) を展開して、\[Doppler Level\] (ドップラー レベル) に「0.1」を入力します。
    -   \[Volume Rolloff\] (音量と距離の関係) を \[Logarithmic Rolloff\]に設定します。
    -   \[Max Distance\] (最長距離) に「20」を設定します。
-   \[Scripts\] フォルダーで、SphereSounds というスクリプトを作成します。
-   SphereSounds をドラッグして、\[Hierarchy\] (階層) パネルの Sphere1 オブジェクトとSphere2 オブジェクトにドロップします。
-   Visual Studio で SphereSounds を開き、次のようにコードを更新して \[すべて保存\] をクリックします。

SphereSounds.cs \[表示\]

-   スクリプトを保存し、Unity に戻ります。
-   アプリをエクスポートしてビルドし、HoloLens に配置します。
-   ステージに近づいたり、離れたり、左右に動いて音の変化を聞き取ります。

## 第 6 章 – 空間マッピング

ここで、ゲーム
ボードを現実世界の現実の物体に持ち込むために、[*空間マッピング*](https://developer.microsoft.com/ja-jp/windows/holographic/spatial_mapping)を使用します。

### 目標

-   現実世界を仮想世界に持ち込む。
-   最も重要な場所にホログラムを配置する。

### 手順

-   Unity の \[Project\] (プロジェクト) パネルで \[Holograms\] フォルダーをクリックします。
-   \[Spatial Mapping\] (空間マッピング) アセットを \[Hierarchy\] (階層) パネルのルートにドラッグします。
-   \[Hierarchy\] (階層) パネルで Spatial Mapping オブジェクトをクリックします。
-   \[Inspector\] (インスペクター) パネルで次のプロパティを変更します。
    -   \[Draw Visual Meshes\] (ビジュアル メッシュの描画) チェック ボックスをオンにします。
    -   \[Draw Material\] (描画素材) に移動して、右側の円をクリックします。上部の検索フィールドに「wireframe」と入力します。結果をクリックしてウィンドウを閉じます。これにより、\[Draw Material\] (描画素材) の値が \[Wireframe\] に変わります。
-   アプリをエクスポートしてビルドし、HoloLens に配置します。
-   アプリを実行すると、ワイヤーフレームのメッシュが現実世界の上に重なります。
-   転がる球体がステージから床に落ちるようすを見守ります。

今度は、OrigamiCollection を新しい場所に移動する方法を示します。

-   \[Scripts\] フォルダーで、TapToPlaceParent というスクリプトを作成します。
-   \[Hierarchy\] (階層) パネルの OrigamiCollection を展開し、Stage オブジェクトを選択します。
-   TapToPlaceParent スクリプトを Stage オブジェクトにドラッグします。
-   Visual Studio で TapToPlaceParent スクリプトを開き、次のようにコードを変更します。

TapToPlaceParent.cs \[表示\]

-   アプリをエクスポートしてビルドし、配置します。
-   これで、ゲームに視線を送り、「選ぶ」ジェスチャーを使ってゲームを新しい場所に移動して、再び「選ぶ」ジェスチャーを行うと、ゲームを特定の場所に移動できるようになります。

## 第 7 章 – ホログラフィックを楽しむ

### 目標

-   ホログラフィックの地下の世界への入り口を暴く。

### 手順

ここでは、ホログラフィックの地下の世界を明らかにする方法について説明します。

-   \[Project\] (プロジェクト) パネルの \[Holograms\] フォルダーで次の操作を行います。
    -   OrigamiCollection の子になるように、Underworld を \[Hierarchy\] (階層) パネルにドラッグします。
-   \[Scripts\] フォルダーで HitTarget というスクリプトを作成します。
-   \[Hierarchy\] (階層) パネルで OrigamiCollection を展開します。
-   Stage オブジェクトを展開し、Target オブジェクト (青い扇) を選びます。
-   HitTarget スクリプトを Target オブジェクトにドラッグします。
-   Visual Studio で HitTarget スクリプトを開き、次のようにコードを変更します。

HitTarget.cs \[表示\]

-   Unity で、Target オブジェクトを選びます。
-   2 つのパブリック プロパティが Hit Target コンポーネントに表示されるようになります。そこで次のようにして、今回のシーンでオブジェクトを参照する必要があります。
    -   \[Hierarchy\] (階層) パネルから Hit Target コンポーネントの \[Underworld\] プロパティに Underworld をドラッグします。
    -   \[Hierarchy\] (階層) パネルから Hit Target コンポーネントの \[Object to Hide\] プロパティに Stage をドラッグします。

&nbsp;
-   アプリをエクスポートしてビルドし、配置します。
-   Origami Collection を床に置き、「選ぶ」ジェスチャーを使って球体を落とします。
-   球体がターゲット (青い扇) に当たると、爆発が起こります。コレクションは消え去り、地下の世界への穴が現れます。

## 終わりに

これで、このチュートリアルは終わりです。

ここでは以下のことを学びました。

-   Unity でホログラフィック アプリを作成する方法。
-   視線、ジェスチャー、音声、音響、空間マッピングを利用する方法。
-   Visual Studio を使ってアプリをビルドおよび配置する方法。

これで、独自のホログラフィック
エクスペリエンスを生み出す準備が整いました。
