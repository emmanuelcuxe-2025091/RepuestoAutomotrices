package com.emmanuelcuxe.RepuestosAutomotrices.service;

import com.emmanuelcuxe.RepuestosAutomotrices.entity.Proveedor;
import com.emmanuelcuxe.RepuestosAutomotrices.repository.ProveedorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProveedorServiceImplements implements ProveedorService {
    private final ProveedorRepository proveedorRepository;

    public ProveedorServiceImplements(ProveedorRepository proveedorRepository) {
        this.proveedorRepository = proveedorRepository;
    }

    @Override
    public List<Proveedor> getAllProveedores() { return proveedorRepository.findAll();
    }

    @Override
    public Proveedor getProveedorById(Integer id) { return proveedorRepository.findById(id).orElse(null);
    }

    @Override
    public Proveedor saveProveedor(Proveedor proveedor) throws RuntimeException { return proveedorRepository.save(proveedor);
    }

    @Override
    public Proveedor updateProveedor(Integer id, Proveedor proveedor) throws RuntimeException{
        proveedor.setIdProveedor(id);
        return proveedorRepository.save(proveedor);
    }

    @Override
    public void deleteProveedor(Integer id) {proveedorRepository.deleteById(id);
    }
}