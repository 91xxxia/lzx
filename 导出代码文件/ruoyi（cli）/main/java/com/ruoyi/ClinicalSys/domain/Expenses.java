package com.ruoyi.ClinicalSys.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 费用对象 expenses
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public class Expenses extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 费用号 */
    private Long expenseId;

    /** 病人号 */
    @Excel(name = "病人号")
    private String patientId;

    /** 费用类别 */
    @Excel(name = "费用类别")
    private String expenseType;

    /** 费用 */
    @Excel(name = "费用")
    private BigDecimal amount;

    public void setExpenseId(Long expenseId) 
    {
        this.expenseId = expenseId;
    }

    public Long getExpenseId() 
    {
        return expenseId;
    }

    public void setPatientId(String patientId) 
    {
        this.patientId = patientId;
    }

    public String getPatientId() 
    {
        return patientId;
    }

    public void setExpenseType(String expenseType) 
    {
        this.expenseType = expenseType;
    }

    public String getExpenseType() 
    {
        return expenseType;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("expenseId", getExpenseId())
            .append("patientId", getPatientId())
            .append("expenseType", getExpenseType())
            .append("amount", getAmount())
            .toString();
    }
}
