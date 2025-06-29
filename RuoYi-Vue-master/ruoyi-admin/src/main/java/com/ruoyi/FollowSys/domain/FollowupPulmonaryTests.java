package com.ruoyi.FollowSys.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 肺功能检查对象 followup_pulmonary_tests
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public class FollowupPulmonaryTests extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 肺功能号 */
    private Long testId;

    /** 随访号 */
    @Excel(name = "随访号")
    private Long followupId;

    /** 肺功能测试日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "肺功能测试日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lungTestDate;

    /** IC */
    @Excel(name = "IC")
    private Long ic;

    /** MEF50 */
    @Excel(name = "MEF50")
    private Long mef50;

    /** FEV1 */
    @Excel(name = "FEV1")
    private Long fev1;

    /** FCV */
    @Excel(name = "FCV")
    private Long fvc;

    /** MMEF75/25 */
    @Excel(name = "MMEF75/25")
    private Long mmef7525;

    /** FEV1/FVC */
    @Excel(name = "FEV1/FVC")
    private Long fev1FvcRatio;

    /** MEF25 */
    @Excel(name = "MEF25")
    private Long mef25;

    /** MEF75 */
    @Excel(name = "MEF75")
    private Long mef75;

    /** MVV */
    @Excel(name = "MVV")
    private Long mvv;

    /** FEV1/VCmax */
    @Excel(name = "FEV1/VCmax")
    private Long fev1VcmaxRatio;

    /** VCmax */
    @Excel(name = "VCmax")
    private Long vcmax;

    /** 结论 */
    @Excel(name = "结论")
    private String lungFunctionConclusion;

    /** 支气管舒张检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支气管舒张检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bronchodilationTestDate;

    /** 支气管舒张检查结果 */
    @Excel(name = "支气管舒张检查结果")
    private String bronchodilationResult;

    /** 支气管激发检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支气管激发检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bronchialChallengeTestDate;

    /** 支气管激发检查结果 */
    @Excel(name = "支气管激发检查结果")
    private String bronchialChallengeResult;

    /** 潮气肺功能检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "潮气肺功能检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date tidalTestDate;

    /** WT */
    @Excel(name = "WT")
    private Long wtPerKg;

    /** RR */
    @Excel(name = "RR")
    private Long rr;

    /** TI */
    @Excel(name = "TI")
    private Long ti;

    /** TE */
    @Excel(name = "TE")
    private Long te;

    /** TI/TE */
    @Excel(name = "TI/TE")
    private Long tiTeRatio;

    /** TPTEF */
    @Excel(name = "TPTEF")
    private Long tptef;

    /** VPTEF */
    @Excel(name = "VPTEF")
    private Long vptef;

    /** TPTEF/TE */
    @Excel(name = "TPTEF/TE")
    private Long tptefTeRatio;

    /** VPEF/VE */
    @Excel(name = "VPEF/VE")
    private Long vpefVeRatio;

    /** PTEF */
    @Excel(name = "PTEF")
    private Long ptef;

    /** TEF50/TIF50 */
    @Excel(name = "TEF50/TIF50")
    private Long tef50Tif50Ratio;

    /** TEF50 */
    @Excel(name = "TEF50")
    private Long tef50;

    /** TEF25 */
    @Excel(name = "TEF25")
    private Long tef25;

    /** TEF25-75 */
    @Excel(name = "TEF25-75")
    private Long tef2575;

    public void setTestId(Long testId) 
    {
        this.testId = testId;
    }

    public Long getTestId() 
    {
        return testId;
    }

    public void setFollowupId(Long followupId) 
    {
        this.followupId = followupId;
    }

    public Long getFollowupId() 
    {
        return followupId;
    }

    public void setLungTestDate(Date lungTestDate) 
    {
        this.lungTestDate = lungTestDate;
    }

    public Date getLungTestDate() 
    {
        return lungTestDate;
    }

    public void setIc(Long ic) 
    {
        this.ic = ic;
    }

    public Long getIc() 
    {
        return ic;
    }

    public void setMef50(Long mef50) 
    {
        this.mef50 = mef50;
    }

    public Long getMef50() 
    {
        return mef50;
    }

    public void setFev1(Long fev1) 
    {
        this.fev1 = fev1;
    }

    public Long getFev1() 
    {
        return fev1;
    }

    public void setFvc(Long fvc) 
    {
        this.fvc = fvc;
    }

    public Long getFvc() 
    {
        return fvc;
    }

    public void setMmef7525(Long mmef7525) 
    {
        this.mmef7525 = mmef7525;
    }

    public Long getMmef7525() 
    {
        return mmef7525;
    }

    public void setFev1FvcRatio(Long fev1FvcRatio) 
    {
        this.fev1FvcRatio = fev1FvcRatio;
    }

    public Long getFev1FvcRatio() 
    {
        return fev1FvcRatio;
    }

    public void setMef25(Long mef25) 
    {
        this.mef25 = mef25;
    }

    public Long getMef25() 
    {
        return mef25;
    }

    public void setMef75(Long mef75) 
    {
        this.mef75 = mef75;
    }

    public Long getMef75() 
    {
        return mef75;
    }

    public void setMvv(Long mvv) 
    {
        this.mvv = mvv;
    }

    public Long getMvv() 
    {
        return mvv;
    }

    public void setFev1VcmaxRatio(Long fev1VcmaxRatio) 
    {
        this.fev1VcmaxRatio = fev1VcmaxRatio;
    }

    public Long getFev1VcmaxRatio() 
    {
        return fev1VcmaxRatio;
    }

    public void setVcmax(Long vcmax) 
    {
        this.vcmax = vcmax;
    }

    public Long getVcmax() 
    {
        return vcmax;
    }

    public void setLungFunctionConclusion(String lungFunctionConclusion) 
    {
        this.lungFunctionConclusion = lungFunctionConclusion;
    }

    public String getLungFunctionConclusion() 
    {
        return lungFunctionConclusion;
    }

    public void setBronchodilationTestDate(Date bronchodilationTestDate) 
    {
        this.bronchodilationTestDate = bronchodilationTestDate;
    }

    public Date getBronchodilationTestDate() 
    {
        return bronchodilationTestDate;
    }

    public void setBronchodilationResult(String bronchodilationResult) 
    {
        this.bronchodilationResult = bronchodilationResult;
    }

    public String getBronchodilationResult() 
    {
        return bronchodilationResult;
    }

    public void setBronchialChallengeTestDate(Date bronchialChallengeTestDate) 
    {
        this.bronchialChallengeTestDate = bronchialChallengeTestDate;
    }

    public Date getBronchialChallengeTestDate() 
    {
        return bronchialChallengeTestDate;
    }

    public void setBronchialChallengeResult(String bronchialChallengeResult) 
    {
        this.bronchialChallengeResult = bronchialChallengeResult;
    }

    public String getBronchialChallengeResult() 
    {
        return bronchialChallengeResult;
    }

    public void setTidalTestDate(Date tidalTestDate) 
    {
        this.tidalTestDate = tidalTestDate;
    }

    public Date getTidalTestDate() 
    {
        return tidalTestDate;
    }

    public void setWtPerKg(Long wtPerKg) 
    {
        this.wtPerKg = wtPerKg;
    }

    public Long getWtPerKg() 
    {
        return wtPerKg;
    }

    public void setRr(Long rr) 
    {
        this.rr = rr;
    }

    public Long getRr() 
    {
        return rr;
    }

    public void setTi(Long ti) 
    {
        this.ti = ti;
    }

    public Long getTi() 
    {
        return ti;
    }

    public void setTe(Long te) 
    {
        this.te = te;
    }

    public Long getTe() 
    {
        return te;
    }

    public void setTiTeRatio(Long tiTeRatio) 
    {
        this.tiTeRatio = tiTeRatio;
    }

    public Long getTiTeRatio() 
    {
        return tiTeRatio;
    }

    public void setTptef(Long tptef) 
    {
        this.tptef = tptef;
    }

    public Long getTptef() 
    {
        return tptef;
    }

    public void setVptef(Long vptef) 
    {
        this.vptef = vptef;
    }

    public Long getVptef() 
    {
        return vptef;
    }

    public void setTptefTeRatio(Long tptefTeRatio) 
    {
        this.tptefTeRatio = tptefTeRatio;
    }

    public Long getTptefTeRatio() 
    {
        return tptefTeRatio;
    }

    public void setVpefVeRatio(Long vpefVeRatio) 
    {
        this.vpefVeRatio = vpefVeRatio;
    }

    public Long getVpefVeRatio() 
    {
        return vpefVeRatio;
    }

    public void setPtef(Long ptef) 
    {
        this.ptef = ptef;
    }

    public Long getPtef() 
    {
        return ptef;
    }

    public void setTef50Tif50Ratio(Long tef50Tif50Ratio) 
    {
        this.tef50Tif50Ratio = tef50Tif50Ratio;
    }

    public Long getTef50Tif50Ratio() 
    {
        return tef50Tif50Ratio;
    }

    public void setTef50(Long tef50) 
    {
        this.tef50 = tef50;
    }

    public Long getTef50() 
    {
        return tef50;
    }

    public void setTef25(Long tef25) 
    {
        this.tef25 = tef25;
    }

    public Long getTef25() 
    {
        return tef25;
    }

    public void setTef2575(Long tef2575) 
    {
        this.tef2575 = tef2575;
    }

    public Long getTef2575() 
    {
        return tef2575;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("testId", getTestId())
            .append("followupId", getFollowupId())
            .append("lungTestDate", getLungTestDate())
            .append("ic", getIc())
            .append("mef50", getMef50())
            .append("fev1", getFev1())
            .append("fvc", getFvc())
            .append("mmef7525", getMmef7525())
            .append("fev1FvcRatio", getFev1FvcRatio())
            .append("mef25", getMef25())
            .append("mef75", getMef75())
            .append("mvv", getMvv())
            .append("fev1VcmaxRatio", getFev1VcmaxRatio())
            .append("vcmax", getVcmax())
            .append("lungFunctionConclusion", getLungFunctionConclusion())
            .append("bronchodilationTestDate", getBronchodilationTestDate())
            .append("bronchodilationResult", getBronchodilationResult())
            .append("bronchialChallengeTestDate", getBronchialChallengeTestDate())
            .append("bronchialChallengeResult", getBronchialChallengeResult())
            .append("tidalTestDate", getTidalTestDate())
            .append("wtPerKg", getWtPerKg())
            .append("rr", getRr())
            .append("ti", getTi())
            .append("te", getTe())
            .append("tiTeRatio", getTiTeRatio())
            .append("tptef", getTptef())
            .append("vptef", getVptef())
            .append("tptefTeRatio", getTptefTeRatio())
            .append("vpefVeRatio", getVpefVeRatio())
            .append("ptef", getPtef())
            .append("tef50Tif50Ratio", getTef50Tif50Ratio())
            .append("tef50", getTef50())
            .append("tef25", getTef25())
            .append("tef2575", getTef2575())
            .toString();
    }
}
