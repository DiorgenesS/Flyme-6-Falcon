.class final Landroid/text/util/UrlSpanHelper$5;
.super Ljava/lang/Object;
.source "UrlSpanHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/text/util/UrlSpanHelper;->showTelDialog(Landroid/view/View;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$mDialog:Landroid/app/AlertDialog;

.field final synthetic val$value:Ljava/lang/CharSequence;

.field final synthetic val$widget:Landroid/view/View;


# direct methods
.method constructor <init>(Ljava/lang/CharSequence;Landroid/view/View;Landroid/app/AlertDialog;)V
    .locals 0
    .param p1, "val$value"    # Ljava/lang/CharSequence;
    .param p2, "val$widget"    # Landroid/view/View;
    .param p3, "val$mDialog"    # Landroid/app/AlertDialog;

    .prologue
    iput-object p1, p0, Landroid/text/util/UrlSpanHelper$5;->val$value:Ljava/lang/CharSequence;

    iput-object p2, p0, Landroid/text/util/UrlSpanHelper$5;->val$widget:Landroid/view/View;

    iput-object p3, p0, Landroid/text/util/UrlSpanHelper$5;->val$mDialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    :try_start_0
    iget-object v2, p0, Landroid/text/util/UrlSpanHelper$5;->val$value:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/text/util/UrlSpanHelper$5;->val$widget:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/util/UrlSpanHelper;->-wrap1(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    iget-object v2, p0, Landroid/text/util/UrlSpanHelper$5;->val$widget:Landroid/view/View;

    new-instance v3, Landroid/text/util/UrlSpanHelper$5$1;

    iget-object v4, p0, Landroid/text/util/UrlSpanHelper$5;->val$mDialog:Landroid/app/AlertDialog;

    iget-object v5, p0, Landroid/text/util/UrlSpanHelper$5;->val$value:Ljava/lang/CharSequence;

    invoke-direct {v3, p0, v4, v5, v1}, Landroid/text/util/UrlSpanHelper$5$1;-><init>(Landroid/text/util/UrlSpanHelper$5;Landroid/app/AlertDialog;Ljava/lang/CharSequence;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
