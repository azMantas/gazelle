# Realizing my thoughts on Azure management

In this repo I am focusing on streamlining Azure management by aligning management group level deployments, 'create new landingzone' processes and shared platform resources. This integration simplifies administrative tasks, freeing up more time within innovating in the cloud. 

## design principles: 

- **everything as Code:** every aspect of the platform is managed by code, leading to a scalable, reproducible environment where direct human interaction is eliminated. 
- **mirrored environment:** test environment is an exact replica of the production platform, providing a safe and controlled space for innovation. This setup boost confidence that the integration of new features is both seamless and reliable. 
- **whitelist approach:** This configuration ensures that only pre-approved resources and configurations are allowed within the environment. It reduces the attack surface and aligns with the Center for Internet Security standards.
  
## simplified operations:

- **Create a new landing zone:** GitHub Actions are designed so that each landing zone has its dedicated parameter file. It acts as a central tool for ongoing management, allowing adjustments in cost, policy, security, or tags.
- **Assign a new policy:** Bicep templates are authored with a mind to add/remove new policies by simply editing the parameters file, kind of a 'bring-your-JSON' approach.
- **Edit RBAC:** managing access permissions is made effortless though the modification of parameters file. Whatever it's creating a new custom role, or adjusting role assignments where cumbersome GUIDs are mapped to user-friendly names. 

