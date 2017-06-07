.class final Landroid/app/Instrumentation$FlymeRecommendActivity;
.super Ljava/lang/Object;
.source "Instrumentation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/Instrumentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlymeRecommendActivity"
.end annotation


# instance fields
.field private mContextThread:Landroid/os/IBinder;

.field private mIntent:Landroid/content/Intent;

.field private mOptions:Landroid/os/Bundle;

.field private mRequestCode:I

.field private mTarget:Landroid/app/Activity;

.field private mToken:Landroid/os/IBinder;

.field private mWho:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "who"    # Landroid/content/Context;
    .param p2, "contextThread"    # Landroid/os/IBinder;
    .param p3, "token"    # Landroid/os/IBinder;
    .param p4, "target"    # Landroid/app/Activity;
    .param p5, "intent"    # Landroid/content/Intent;
    .param p6, "requestCode"    # I
    .param p7, "options"    # Landroid/os/Bundle;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mWho:Landroid/content/Context;

    iput-object p2, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mContextThread:Landroid/os/IBinder;

    iput-object p3, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mToken:Landroid/os/IBinder;

    iput-object p4, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mTarget:Landroid/app/Activity;

    iput-object p5, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mIntent:Landroid/content/Intent;

    iput p6, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mRequestCode:I

    iput-object p7, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mOptions:Landroid/os/Bundle;

    return-void
.end method

.method private start(ILandroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 14
    .param p1, "result"    # I
    .param p2, "who"    # Landroid/content/Context;
    .param p3, "contextThread"    # Landroid/os/IBinder;
    .param p4, "token"    # Landroid/os/IBinder;
    .param p5, "target"    # Landroid/app/Activity;
    .param p6, "intent"    # Landroid/content/Intent;
    .param p7, "requestCode"    # I
    .param p8, "options"    # Landroid/os/Bundle;

    .prologue
    move-object/from16 v2, p3

    check-cast v2, Landroid/app/IApplicationThread;

    .local v2, "whoThread":Landroid/app/IApplicationThread;
    const/4 v13, 0x1

    .local v13, "isRecommend":Z
    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    invoke-virtual/range {p6 .. p6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual/range {p6 .. p6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v13, :cond_0

    new-instance v4, Landroid/content/Intent;

    const-string v1, "android.intent.action.RECOMMEND"

    invoke-direct {v4, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v4, "itt":Landroid/content/Intent;
    const-string v1, "android.intent.extra.INTENT"

    move-object/from16 v0, p6

    invoke-virtual {v4, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getBasePackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v5

    if-eqz p5, :cond_1

    move-object/from16 v0, p5

    iget-object v7, v0, Landroid/app/Activity;->mEmbeddedID:Ljava/lang/String;

    :goto_0
    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v6, p4

    move/from16 v8, p7

    move-object/from16 v11, p8

    invoke-interface/range {v1 .. v11}, Landroid/app/IActivityManager;->startActivity(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/os/Bundle;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "itt":Landroid/content/Intent;
    :cond_0
    :goto_1
    return-void

    .restart local v4    # "itt":Landroid/content/Intent;
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    :catch_0
    move-exception v12

    .local v12, "e":Ljava/lang/Exception;
    goto :goto_1
.end method


# virtual methods
.method public clearData()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mWho:Landroid/content/Context;

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mContextThread:Landroid/os/IBinder;

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mToken:Landroid/os/IBinder;

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mTarget:Landroid/app/Activity;

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mIntent:Landroid/content/Intent;

    iput-object v0, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mOptions:Landroid/os/Bundle;

    return-void
.end method

.method public start(I)V
    .locals 9
    .param p1, "result"    # I

    .prologue
    iget-object v2, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mWho:Landroid/content/Context;

    iget-object v3, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mContextThread:Landroid/os/IBinder;

    iget-object v4, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mToken:Landroid/os/IBinder;

    iget-object v5, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mTarget:Landroid/app/Activity;

    iget-object v6, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mIntent:Landroid/content/Intent;

    iget v7, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mRequestCode:I

    iget-object v8, p0, Landroid/app/Instrumentation$FlymeRecommendActivity;->mOptions:Landroid/os/Bundle;

    move-object v0, p0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Landroid/app/Instrumentation$FlymeRecommendActivity;->start(ILandroid/content/Context;Landroid/os/IBinder;Landroid/os/IBinder;Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Instrumentation$FlymeRecommendActivity;->clearData()V

    return-void
.end method
