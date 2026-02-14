package com.emmanuelcuxe.RepuestosAutomotrices.service;

import com.emmanuelcuxe.RepuestosAutomotrices.entity.Repuesto;
import com.emmanuelcuxe.RepuestosAutomotrices.repository.RepuestoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepuestoServiceImplements implements RepuestoService{

    private final RepuestoRepository repuestoRepository;

    public RepuestoServiceImplements(RepuestoRepository repuestoRepository) {
        this.repuestoRepository = repuestoRepository;
    }

    @Override
    public List<Repuesto> getAllRepuestos() { return repuestoRepository.findAll();
    }

    @Override
    public Repuesto getRepuestoById(Integer id) { return repuestoRepository.findById(id).orElse(null);
    }

    @Override
    public Repuesto saveRepuesto(Repuesto repuesto) throws RuntimeException { return repuestoRepository.save(repuesto);
    }

    @Override
    public Repuesto updateRepuesto(Integer id, Repuesto repuesto) throws RuntimeException{
        repuesto.setIdRepuesto(id);
        return repuestoRepository.save(repuesto);
    }

    @Override
    public void deleteRepuesto(Integer id) {repuestoRepository.deleteById(id);
    }
}